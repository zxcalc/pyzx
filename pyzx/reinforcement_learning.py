import datetime
import numpy as np
import matplotlib.pyplot as plt
from collections import namedtuple
from itertools import count

import torch
import torch.optim as optim
import torch.nn.functional as F
import torchvision.transforms as T

np.random.seed(1337)
# if gpu is to be used
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print("cuda" if torch.cuda.is_available() else "cpu")

Transition = namedtuple('Transition',
                        ('state', 'action', 'next_state', 'reward'))

from .replay_memory import ReplayMemory
from .neural_networks import DQN, Duel_DQN, FC_Embedding, CNN_Embedding

from .routing.architecture import create_architecture, SQUARE, LINE, FULLY_CONNNECTED
from .routing.cnot_mapper import gauss, GENETIC_GAUSS_MODE
from .parity_maps import build_random_parity_map, CNOT_tracker
from .linalg import Mat2

class Environment():

    def __init__(self, architecture, max_gates, test_size=50, allow_perm=True, beta=0.4):
        self.n_qubits = architecture.n_qubits
        self.architecture = architecture
        self.max_gates = max_gates
        self.actions = [(v1, v2) for v1, v2 in architecture.graph.edges()] + [(v2, v1) for v1, v2 in architecture.graph.edges()] 
        self.n_actions = len(self.actions)
        self.reset()
        self.test_set = self.create_test_set()
        self.allow_perm = allow_perm
        self.beta = beta

    def create_test_set(self, fitting=False):
        return [self._create_instance(fitting) for _ in range(test_size)]

    def _create_instance(self, fitting=True):
        n_cnots = np.random.choice(self.max_gates)+1
        if fitting:
            matrix = build_random_parity_map(self.n_qubits, n_cnots, architecture=self.architecture)
        else:
            matrix = build_random_parity_map(self.n_qubits, n_cnots)
        matrix = matrix[:, np.random.permutation(matrix.shape[1])]
        return Mat2(matrix.tolist()), n_cnots

    def reset(self, fitting=True):
        self.matrix = self._create_instance(fitting)[0]

    def start(self, matrix):
        self.matrix = matrix

    def get_state(self):
        return torch.Tensor(np.expand_dims(self.matrix.data, axis=0)).to(device)
    
    def step(self, action):
        control, target = self.actions[action]
        self.matrix.row_add(control, target)
        reward, done = self.reward()
        return self.matrix, reward, done, []

    def reward(self):
        distance = len([v for row in self.matrix.data for v in row if v == 1]) - self.n_qubits
        done = len([v for row in self.matrix.data for v in row if v == 0]) == self.n_qubits * (n_qubits - 1)
        diag = [self.matrix.data[i][i]==1 for i in range(n_qubits)]
        if not self.allow_perm:
            done = done and all(diag)
        reward = -(distance/self.n_qubits**2)**self.beta
        reward = torch.Tensor(np.asarray(reward, dtype=np.float32)).to(device)
        return reward, done


BATCH_SIZE = 1024
GAMMA = 0.
EPS_START = 0.9
EPS_END = 0.05
EPS_DECAY = 200
TARGET_UPDATE = 10

hidden = [1000, 500, 100]
memory_size = 100000
test_size = 50
max_gates = 30
n_qubits = 3
prioritized = False
mode = "dueling"
architecture = create_architecture(LINE, n_qubits=n_qubits)

env = Environment(architecture, max_gates, test_size)
n_actions = env.n_actions
n_qubits = env.n_qubits

if mode == "dueling":
    embedding = FC_Embedding(n_qubits, hidden[-2], hidden[:-2])
    #embedding = CNN_Embedding(n_qubits, hidden[-2])
else:
    embedding = FC_Embedding(n_qubits, n_actions, hidden)
network = DQN
loss_function = F.smooth_l1_loss
if mode == "dqn":
    double_dqn = False
    periodic_update = True
elif mode == "ddqn":
    double_dqn = True
    periodic_update = True
elif mode == "ddqn2":
    double_dqn = True
    periodic_update = False
elif mode == "dueling":
    double_dqn = True
    periodic_update = True
    network = lambda i, o, e: Duel_DQN(i, o, e, fc1=hidden[-2], fc2=hidden[-1])
    #loss_function = F.mse_loss

print("Environment created", architecture.name, n_qubits, n_actions)

policy_net = network(n_qubits, n_actions, embedding).to(device)
target_net = network(n_qubits, n_actions, embedding).to(device)
target_net.load_state_dict(policy_net.state_dict())
target_net.eval()

optimizer = optim.RMSprop(policy_net.parameters())
memory = ReplayMemory(memory_size, prioritized=prioritized)

periodic_update = periodic_update or not double_dqn
losses = []
steps_done = 0
discount_factor = GAMMA

def select_action(state):
    global steps_done
    sample = np.random.rand()
    eps_threshold = EPS_END + (EPS_START - EPS_END) * np.exp(-1. * steps_done / EPS_DECAY)
    steps_done += 1
    if sample > eps_threshold:
        with torch.no_grad():
            # t.max(1) will return largest column value of each row.
            # second column on max result is index of where max element was
            # found, so we pick action with the larger expected reward.

            return policy_net(state).max(1)[1].view(1, 1)
    else:
        return torch.tensor([[np.random.choice(n_actions)]], device=device, dtype=torch.long)

def optimize_model(policy_net, target_net):
    if len(memory) < BATCH_SIZE:
        return
    transitions, idxs, is_weights = memory.sample(BATCH_SIZE)
    # Transpose the batch (see https://stackoverflow.com/a/19343/3343043 for
    # detailed explanation). This converts batch-array of Transitions
    # to Transition of batch-arrays.
    batch_size = len(transitions) # TODO - deal with different batch sizes for better GPU memory allocation!
    batch = Transition(*zip(*transitions))

    # Compute a mask of non-final states and concatenate the batch elements
    # (a final state would've been the one after which simulation ended)
    non_final_mask = torch.tensor(tuple(map(lambda s: s is not None,
                                          batch.next_state)), device=device, dtype=torch.uint8)
    non_final_next_states = torch.cat([s for s in batch.next_state
                                                if s is not None])
                                                
    state_batch = torch.cat(batch.state, dim=0)
    action_batch = torch.cat(batch.action)
    reward_batch = torch.cat(batch.reward)

    # Compute Q(s_t, a) - the model computes Q(s_t), then we select the
    # columns of actions taken. These are the actions which would've been taken
    # for each batch state according to policy_net
    state_action_values = policy_net(state_batch).gather(1, action_batch)

    # Compute V(s_{t+1}) for all next states.
    # Expected values of actions for non_final_next_states are computed based
    # on the "older" target_net; selecting their best reward with max(1)[0].
    # This is merged based on the mask, such that we'll have either the expected
    # state value or 0 in case the state was final.
    next_state_values = torch.zeros(batch_size, device=device)
    if double_dqn:
        next_state_actions = policy_net(non_final_next_states).max(1, keepdim=True)[1]
        next_state_values[non_final_mask] = target_net(non_final_next_states).gather(1, next_state_actions).flatten()
    else:
        next_state_values[non_final_mask] = target_net(non_final_next_states).max(1)[0].detach()
    # Compute the expected Q values
    expected_state_action_values = (next_state_values * discount_factor) + reward_batch

    #errors = torch.abs(state_action_values -expected_state_action_values.unsqueeze(1)).data.cpu().numpy()
    #memory.update(errors, idxs)

    # Compute Huber loss
    loss = F.smooth_l1_loss(state_action_values, expected_state_action_values.unsqueeze(1), reduction="none")
    #print(loss)
    memory.update(loss.data.cpu().numpy(), idxs)
    loss = torch.mul(torch.tensor(is_weights, device=device, dtype=torch.float), loss)
    #print(loss)
    loss = loss.mean()
    #print(loss)
    # Compute MSE loss
    #loss = F.mse_loss(state_action_values, expected_state_action_values.unsqueeze(1))

    # Optimize the model
    optimizer.zero_grad()
    loss.backward()
    losses.append(loss.data.item())
    for param in policy_net.parameters():
        param.grad.data.clamp_(-1, 1)
    optimizer.step()

num_episodes = 300
stats = []
start_time = datetime.datetime.now()
prev_epochs = 2*EPS_DECAY-1
for n_gates in range(1, max_gates+1):
    steps_done = 0
    #EPS_DECAY = max(1., (prev_epochs+1)*0.1)
    #memory.reset()
    n_episodes = 0
    discount_factor = GAMMA
    dataset_start = datetime.datetime.now()
    losses = []
    env.max_gates = n_gates
    test_set = env.create_test_set(fitting=True)
    for i_episode in count():#range(num_episodes):
        # Initialize the environment and state
        env.reset()
        state = env.get_state()
        start = datetime.datetime.now()
        for t in range(n_gates+1):#count():
            # Select and perform an action
            action = select_action(state)
            _, reward, done, _ = env.step(action.item())
            """
            if done:
                reward = 10. # success
            elif t == n_gates:
                reward = -10. # Fail
            else:
                reward = -0.5 # an extra step"""
            reward = torch.tensor([reward], device=device)
            target = policy_net(state).data[0]
            old_val = target[action]

            # Observe new state
            if not done:
                next_state = env.get_state()
                target_val = target_net(next_state).data[0]
                error = abs(old_val - reward - discount_factor*torch.max(target_val))
            else:
                next_state = None
                error = abs(old_val - reward)

            # These are new items, so first add them with a rediculous error so they are picked first XD
            #error = 100
            # Store the transition in memory
            memory.push(error, Transition(state, action, next_state, reward))

            # Move to the next state
            state = next_state

            # Perform one step of the optimization (on the target network)
            if periodic_update or np.random.rand(1) < 0.5:
                optimize_model(policy_net, target_net)
            else:
                optimize_model(target_net, policy_net)
            #discount_factor = 1. - 0.98*(1.-discount_factor)

            if done:
                break
            if datetime.datetime.now() - start > datetime.timedelta(minutes=1): break
        # Update the target network, copying all weights and biases in DQN
        if periodic_update and i_episode % TARGET_UPDATE == 0:
            target_net.load_state_dict(policy_net.state_dict())
        time = datetime.datetime.now() - start_time
        if losses:
            mean_loss = np.mean(losses)
            if i_episode % 10 == 0:
                print("\t".join(["gates", "episode", "time\t", "loss", "done", "cnots", "min", "max"]))
                counts = []
                for m, n in test_set:
                    env.start(m)
                    state = env.get_state()
                    for t in range(n_gates+1):
                        # Select and perform an action
                        action = policy_net(state).max(1)[1].view(1, 1)
                        _, reward, done, _ = env.step(action.item())
                        state = env.get_state()
                        if done:
                            overhead = (t+1)/n
                            counts.append(overhead)
                            break
                    else: 
                        # Retry when sometimes taking non-optimal actions.
                        env.start(m)
                        state = env.get_state()
                        topk = 2
                        for t in range(n_gates +1):
                            # Select and perform an action
                            choice = np.random.randint(topk)
                            actions = policy_net(state).topk(topk, dim=1)
                            action = actions.indices[0][choice].view(1,1)
                            #action = policy_net(state).max(1)[1].view(1, 1)
                            _, reward, done, _ = env.step(action.item())
                            state = env.get_state()
                            if done:
                                overhead = (t+1)/n
                                counts.append(overhead)
                                break
                            
                if counts:
                    print("\t".join([str(n_gates), str(i_episode), str(time)[:-3]] + ["{:2.3f}".format(i*100) for i in [mean_loss, len(counts)/test_size, np.mean(counts), min(counts), max(counts)]]))
                    if len(counts) == test_size: break
                else:
                    print("\t".join([str(n_gates), str(i_episode), str(time)[:-3]] + ["{:2.3f}".format(i) for i in [mean_loss, len(counts)/test_size, np.nan, np.nan, np.nan]]))
            else:
                #print("\t".join(["episode", "loss"]))
                print("\t".join([str(n_gates), str(i_episode), str(time)[:-3]] + ["{:2.3f}".format(i*100) for i in [mean_loss]]))
        else:
            #if i_episode % 10 == 0: 
            #    print("episode\ttime\t")
            #print("\t".join([str(n_gates), str(i_episode), str(time)[:-3]]))
            n_episodes += 1
    prev_epochs = i_episode - n_episodes
    statistics = {}
    statistics["gates"] = n_gates
    statistics["episodes"] = prev_epochs #Adjust for initializing the memory
    statistics["time finished"] = datetime.datetime.now() - dataset_start
    statistics["loss"] = np.mean(losses) if losses else np.nan 
    stats.append(statistics)

p = ["gates", "episodes", "time finished", "loss"]
print("\t".join(p))
for d in stats:
    print("\t".join([str(d[k]) for k in p]))
counts = []
baseline = []
for m, n in test_set:
    cn = CNOT_tracker(n_qubits)
    gauss(GENETIC_GAUSS_MODE, m.copy(), architecture, full_reduce=True, x=cn)
    baseline.append(cn.count_cnots()/n)
    env.start(m)
    state = env.get_state()
    for t in range(n_qubits**2 +1):
        # Select and perform an action
        action = policy_net(state).max(1)[1].view(1, 1)
        _, reward, done, _ = env.step(action.item())
        state = env.get_state()
        if done:
            overhead = (t+1)/n
            counts.append(overhead)
            break
    else: 
        # Retry when sometimes taking non-optimal actions.
        env.start(m)
        state = env.get_state()
        topk = 2
        for t in range(n_qubits**2 +1):
            # Select and perform an action
            choice = np.random.randint(topk)
            actions = policy_net(state).topk(topk, dim=1)
            action = actions.indices[0][choice].view(1,1)
            #action = policy_net(state).max(1)[1].view(1, 1)
            _, reward, done, _ = env.step(action.item())
            state = env.get_state()
            if done:
                overhead = (t+1)/n
                counts.append(overhead)
                break
                
print("Training finished", architecture.name, n_qubits, n_actions)
print(mode, prioritized)
print("Final performance:")  
print("\t".join(["gates", "episode", "total", "time\t", "loss", "done", "cnots", "min", "max", "baseline"]))
if counts:
    print("\t".join([str(max_gates), "Eval", str(sum([s["episodes"]+1 for s in stats])), str(time)[:-3], "-"] + ["{:2.3f}".format(i*100) for i in [len(counts)/test_size, np.mean(counts), min(counts), max(counts), np.mean(baseline)]]))

exit(1)
