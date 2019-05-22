import datetime
import numpy as np
import matplotlib.pyplot as plt
from collections import namedtuple
from itertools import count

import torch
import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F
import torchvision.transforms as T

# if gpu is to be used
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print("cuda" if torch.cuda.is_available() else "cpu")

Transition = namedtuple('Transition',
                        ('state', 'action', 'next_state', 'reward'))

class SumTree:
    write = 0
    e = 0.01
    a = 0.6
    beta = 0.4
    beta_increment_per_sampling = 0.001

    def __init__(self, capacity):
        self.capacity = capacity
        self.tree = np.zeros(2 * capacity - 1)
        self.data = np.zeros(capacity, dtype=object)
        self.n_entries = 0

    def _get_priority(self, error):
        return (error + self.e) ** self.a

    def sample(self, n):
        batch = []
        idxs = []
        segment = self.total() / n
        priorities = []

        self.beta = np.min([1., self.beta + self.beta_increment_per_sampling])

        for i in range(n):
            a = segment * i
            b = segment * (i + 1)
            data = 0 # Handle cases where the memory is not yet completely full
            iter_fallback = 0
            while data == 0 :
                if iter_fallback > segment**2:
                    #print("---- Could not sample a data point from the memory segment")
                    break
                s = np.random.uniform(a, b)
                (idx, p, data) = self.get(s)
                iter_fallback += 1
            else:
                priorities.append(p)
                idxs.append(idx)
                batch.append(data)

        #sampling_probabilities = priorities / self.total()
        #is_weight = np.power(self.tree.n_entries * sampling_probabilities, -self.beta)
        #is_weight /= is_weight.max()
        return batch, idxs#, is_weight

    # update to the root node
    def _propagate(self, idx, change):
        parent = (idx - 1) // 2

        self.tree[parent] += change

        if parent != 0:
            self._propagate(parent, change)

    # find sample on leaf node
    def _retrieve(self, idx, s):
        left = 2 * idx + 1
        right = left + 1

        if left >= len(self.tree):
            return idx

        if s <= self.tree[left]:
            return self._retrieve(left, s)
        else:
            return self._retrieve(right, s - self.tree[left])

    def total(self):
        return self.tree[0]

    # store priority and sample
    def add(self, error, sample):
        p = self._get_priority(error)
        idx = self.write + self.capacity - 1

        self.data[self.write] = sample
        self.update(idx, p)

        self.write = (self.write + 1) % self.capacity
        self.n_entries = min(self.n_entries + 1, self.capacity-1)

    # update priority
    def update(self, idx, p):
        change = p - self.tree[idx]
        self.tree[idx] = p
        self._propagate(idx, change)

    # get priority and sample
    def get(self, s):
        idx = self._retrieve(0, s)
        dataIdx = idx - self.capacity + 1
        return (idx, self.tree[idx], self.data[dataIdx])

    def __len__(self):
        return self.n_entries

class Storage():
    position = 0

    def __init__(self, capacity):
        self.capacity = capacity
        self.data = []
        self.n_entries = 0

    # store priority and sample
    def add(self, error, sample):
        """Saves a transition."""
        if len(self.data) < self.capacity:
            self.data.append(None)
        self.data[self.position] = sample
        self.position = (self.position + 1) % self.capacity

    # update priority
    def update(self, idx, p):
        pass
    
    def sample(self, batch_size):
        choices = np.random.choice(len(self.data), batch_size)
        return [self.data[i] for i in choices], choices
    
    def __len__(self):
        return len(self.data)
        
class ReplayMemory(object):

    def __init__(self, capacity, prioritized=False):
        self.capacity = capacity
        self.prioritized = prioritized
        if prioritized:
            self.memory = SumTree(capacity)
        else:
            self.memory = Storage(capacity)

    def push(self, error, *args):
        """Saves a transition."""
        self.memory.add(error, Transition(*args))

    def sample(self, batch_size):
        return self.memory.sample(batch_size)
    
    def update(self, errors, idxs):
        for i, idx in enumerate(idxs):
            self.memory.update(idx, errors[i])

    def __len__(self):
        return len(self.memory)

from .utils import make_into_list

class DQN(nn.Module):

    def __init__(self, n_qubits, outputs, hidden=100):
        super(DQN, self).__init__()
        hidden = make_into_list(hidden)
        layers = [layer for in_size, out_size in zip([n_qubits*n_qubits] + hidden, hidden + [outputs]) 
                        for layer in [nn.Linear(in_size, out_size), nn.ReLU()]][:-1]
        self.layers = nn.Sequential( *layers
        )
        self.n_qubits = n_qubits

    # Called with either one element to determine next action, or a batch
    # during optimization. Returns tensor([[left0exp,right0exp]...]).
    def forward(self, x):
        x = x.view(x.size(0), -1)
        return self.layers(x)


class Duel_DQN(nn.Module):

    def __init__(self, n_qubits, n_actions, hidden=100):
        super(Duel_DQN, self).__init__()
        hidden = make_into_list(hidden)
        if len(hidden) == 1:
            hidden += hidden[-1:]
        self.relu = nn.ReLU()
        layers = [layer for in_size, out_size in zip([n_qubits*n_qubits] + hidden, hidden[:-1])
                        for layer in [nn.Linear(in_size, out_size), self.relu]][:-1]
        self.layers = nn.Sequential(*layers)

        self.fc1_adv = nn.Linear(hidden[-2], hidden[-1])
        self.fc1_val = nn.Linear(hidden[-2], hidden[-1])

        self.fc2_adv = nn.Linear(hidden[-1], n_actions)
        self.fc2_val = nn.Linear(hidden[-1], 1)
        self.n_qubits = n_qubits
        self.n_actions = n_actions

    # Called with either one element to determine next action, or a batch
    # during optimization. Returns tensor([[left0exp,right0exp]...]).
    def forward(self, x):
        x = x.view(x.size(0), -1)
        x = self.relu(self.layers(x))
        adv = self.relu(self.fc1_adv(x))
        val = self.relu(self.fc1_val(x))
        adv = self.fc2_adv(adv)
        val = self.fc2_val(val).expand(x.size(0), self.n_actions)
        
        x = val + adv - adv.mean(1).unsqueeze(1).expand(x.size(0), self.n_actions)
        return x

from .routing.architecture import create_architecture, SQUARE, LINE, FULLY_CONNNECTED
from .routing.steiner import steiner_gauss
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
        #reward = len([v for row in self.matrix.data for v in row if v == 0])
        done = len([v for row in self.matrix.data for v in row if v == 0]) == self.n_qubits * (n_qubits - 1)
        diag = [self.matrix.data[i][i]==1 for i in range(n_qubits)]
        if not self.allow_perm:
            done = done and all(diag)
        #reward *= len([v for v in diag if v]) + 1
        #m = self.matrix.copy()
        #cn = CNOT_tracker(self.n_qubits)
        #steiner_gauss(m, self.architecture, full_reduce=True, x=cn)
        #reward = -cn.count_cnots()
        #reward = 1 if done else 0
        reward = -(distance/self.n_qubits**2)**self.beta
        reward = torch.Tensor(np.asarray(reward, dtype=np.float32)).to(device)
        return reward, done


BATCH_SIZE = 1024
GAMMA = 0.5
EPS_START = 0.9
EPS_END = 0.05
EPS_DECAY = 200
TARGET_UPDATE = 10

hidden = [1000, 500, 100]
memory_size = 100000
test_size = 50
max_gates = 30
n_qubits = 5
prioritized = False
mode = "dueling"
architecture = create_architecture(LINE, n_qubits=n_qubits)

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
    network = Duel_DQN
    #loss_function = F.mse_loss

env = Environment(architecture, max_gates, test_size)
n_actions = env.n_actions
n_qubits = env.n_qubits
print("Environment created", architecture.name, n_qubits, n_actions)

policy_net = network(n_qubits, n_actions, hidden=hidden).to(device)
target_net = network(n_qubits, n_actions, hidden=hidden).to(device)
target_net.load_state_dict(policy_net.state_dict())
target_net.eval()

optimizer = optim.RMSprop(policy_net.parameters())
memory = ReplayMemory(memory_size, prioritized=prioritized)

periodic_update = periodic_update or not double_dqn
losses = []
steps_done = 0


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


episode_durations = []
def plot_durations():
    plt.figure(2)
    plt.clf()
    durations_t = torch.tensor(episode_durations, dtype=torch.float)
    plt.title('Training...')
    plt.xlabel('Episode')
    plt.ylabel('Duration')
    plt.plot(durations_t.numpy())
    # Take 100 episode averages and plot them too
    if len(durations_t) >= 100:
        means = durations_t.unfold(0, 100, 1).mean(1).view(-1)
        means = torch.cat((torch.zeros(99), means))
        plt.plot(means.numpy())

    plt.pause(0.001)  # pause a bit so that plots are updated

def optimize_model(policy_net, target_net):
    if len(memory) < BATCH_SIZE:
        return
    transitions, idxs = memory.sample(BATCH_SIZE)
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
    expected_state_action_values = (next_state_values * GAMMA) + reward_batch

    errors = torch.abs(state_action_values -expected_state_action_values.unsqueeze(1)).data.cpu().numpy()
    memory.update(errors, idxs)

    # Compute Huber loss
    loss = F.smooth_l1_loss(state_action_values, expected_state_action_values.unsqueeze(1))
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
for n_gates in range(1, max_gates+1):
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
                error = abs(old_val - reward - GAMMA*torch.max(target_val))
            else:
                next_state = None
                error = abs(old_val - reward)

            # Store the transition in memory
            memory.push(error, state, action, next_state, reward)

            # Move to the next state
            state = next_state

            # Perform one step of the optimization (on the target network)
            if periodic_update or np.random.rand(1) < 0.5:
                optimize_model(policy_net, target_net)
            else:
                optimize_model(target_net, policy_net)

            if done:
                episode_durations.append(t + 1)
                #plot_durations()
                break
            if datetime.datetime.now() - start > datetime.timedelta(minutes=1): break
            #if t > 2*max_steps: print(t)
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
            if i_episode % 10 == 0: 
                print("episode\ttime\t")
            print("\t".join([str(n_gates), str(i_episode), str(time)[:-3]]))
    statistics = {}
    statistics["gates"] = n_gates
    statistics["episodes"] = i_episode
    statistics["time finished"] = datetime.datetime.now() - start
    statistics["loss"] = np.mean(losses) if losses else np.nan 
    stats.append(statistics)

p = ["gates", "episodes", "time finished", "loss"]
print("\t".join(p))
for d in stats:
    print("\t".join([str(d[k]) for k in p]))
from .routing.cnot_mapper import gauss, GENETIC_GAUSS_MODE
counts = []
baseline = []
for m, n in test_set:
    cn = CNOT_tracker(n_qubits)
    gauss(GENETIC_GAUSS_MODE, m.copy(), architecture, full_reduce=True, x=cn)
    baseline.append(cn.count_cnots()/n)
    env.start(m)
    state = env.get_state()
    for t in count():
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
                
print("Training finished", architecture.name, n_qubits, n_actions)
print(mode, prioritized)
print("Final performance:")  
print("\t".join(["gates", "episode", "total", "time\t", "loss", "done", "cnots", "min", "max", "baseline"]))
if counts:
    print("\t".join([str(max_gates), "Eval", str(sum([s["episodes"]+1 for s in stats])), str(time)[:-3], "-"] + ["{:2.3f}".format(i) for i in [len(counts)/test_size, np.mean(counts), min(counts), max(counts), np.mean(baseline)]]))

exit(1)
