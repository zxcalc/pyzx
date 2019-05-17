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

Transition = namedtuple('Transition',
                        ('state', 'action', 'next_state', 'reward'))


class ReplayMemory(object):

    def __init__(self, capacity):
        self.capacity = capacity
        self.memory = []
        self.position = 0

    def push(self, *args):
        """Saves a transition."""
        if len(self.memory) < self.capacity:
            self.memory.append(None)
        self.memory[self.position] = Transition(*args)
        self.position = (self.position + 1) % self.capacity

    def sample(self, batch_size):
        choices = np.random.choice(len(self.memory), batch_size)
        return [self.memory[i] for i in choices]

    def __len__(self):
        return len(self.memory)

class DQN(nn.Module):

    def __init__(self, n_qubits, outputs, hidden=100):
        super(DQN, self).__init__()
        self.layers = nn.Sequential(
            nn.Linear(n_qubits*n_qubits, hidden),
            nn.ReLU(),
            nn.Linear(hidden, outputs)
        )
        self.n_qubits = n_qubits

    # Called with either one element to determine next action, or a batch
    # during optimization. Returns tensor([[left0exp,right0exp]...]).
    def forward(self, x):
        x = x.view(x.size(0), -1)
        return self.layers(x)

from .routing.architecture import create_architecture, SQUARE
from .parity_maps import build_random_parity_map
from .linalg import Mat2

class Environment():

    def __init__(self, architecture, max_gates, test_size=50, allow_perm=True):
        self.n_qubits = architecture.n_qubits
        self.max_gates = max_gates
        self.actions = [(v1, v2) for v1, v2 in architecture.graph.edges()] + [(v2, v1) for v1, v2 in architecture.graph.edges()] 
        self.n_actions = len(self.actions)
        self.reset()
        self.test_set = [self._create_instance() for _ in range(test_size)]
        self.allow_perm = allow_perm

    def _create_instance(self):
        n_cnots = np.random.choice(self.max_gates)+1
        return Mat2(build_random_parity_map(self.n_qubits, n_cnots).tolist()), n_cnots

    def reset(self):
        self.matrix = self._create_instance()[0]

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
        reward = len([v for row in self.matrix.data for v in row if v == 0])
        done = reward == self.n_qubits * (n_qubits - 1)
        if not self.allow_perm:
            diag = [self.matrix.data[i][i]==1 for i in range(n_qubits)]
            done = done and all(diag)
            reward *= len([v for v in diag if v]) + 1
        reward = torch.Tensor(np.asarray(reward, dtype=np.float32)).to(device)
        return reward, done


BATCH_SIZE = 256
GAMMA = 0.999
EPS_START = 0.9
EPS_END = 0.05
EPS_DECAY = 200
TARGET_UPDATE = 10

hidden = 1000
periodic_update = False
double_dqn = True
memory_size = 100000
test_size = 50
max_gates = 30
max_steps = max_gates*max_gates

architecture = create_architecture(SQUARE, n_qubits=9)
env = Environment(architecture, max_gates, test_size)
n_actions = env.n_actions
n_qubits = env.n_qubits
print("Environment created", architecture.name, n_qubits, n_actions)

policy_net = DQN(n_qubits, n_actions, hidden=hidden).to(device)
target_net = DQN(n_qubits, n_actions, hidden=hidden).to(device)
target_net.load_state_dict(policy_net.state_dict())
target_net.eval()

optimizer = optim.RMSprop(policy_net.parameters())
memory = ReplayMemory(memory_size)

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
    transitions = memory.sample(BATCH_SIZE)
    # Transpose the batch (see https://stackoverflow.com/a/19343/3343043 for
    # detailed explanation). This converts batch-array of Transitions
    # to Transition of batch-arrays.
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
    next_state_values = torch.zeros(BATCH_SIZE, device=device)
    if double_dqn:
        next_state_actions = policy_net(non_final_next_states).max(1, keepdim=True)[1]
        next_state_values[non_final_mask] = target_net(non_final_next_states).gather(1, next_state_actions).flatten()
    else:
        next_state_values[non_final_mask] = target_net(non_final_next_states).max(1)[0].detach()
    # Compute the expected Q values
    expected_state_action_values = (next_state_values * GAMMA) + reward_batch

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
start_time = datetime.datetime.now()
for i_episode in count():#range(num_episodes):
    # Initialize the environment and state
    env.reset()
    state = env.get_state()
    for t in count():
        # Select and perform an action
        action = select_action(state)
        _, reward, done, _ = env.step(action.item())
        reward = torch.tensor([reward], device=device)

        # Observe new state
        if not done:
            next_state = env.get_state()
        else:
            next_state = None

        # Store the transition in memory
        memory.push(state, action, next_state, reward)

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
        #if t > 2*max_steps: print(t)
    # Update the target network, copying all weights and biases in DQN
    if periodic_update and i_episode % TARGET_UPDATE == 0:
        target_net.load_state_dict(policy_net.state_dict())
    time = datetime.datetime.now() - start_time
    if losses:
        mean_loss = np.mean(losses)
        if i_episode % 10 == 0:
            print("\t".join(["episode", "time\t", "loss", "done", "cnots", "min", "max"]))
            losses = []
            counts = []
            for m, n in env.test_set:
                env.start(m)
                state = env.get_state()
                for t in range(max_steps):
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
                    for t in range(max_steps):
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
                print("\t".join([str(i_episode), str(time)[:-3]] + ["{:2.2f}".format(i) for i in [mean_loss, len(counts)/test_size, np.mean(counts), min(counts), max(counts)]]))
            else:
                print("\t".join([str(i_episode), str(time)[:-3]] + ["{:2.2f}".format(i) for i in [mean_loss, len(counts)/test_size, np.nan, np.nan, np.nan]]))
        else:
            #print("\t".join(["episode", "loss"]))
            print("\t".join([str(i_episode), str(time)[:-3]] + ["{:2.2f}".format(i) for i in [mean_loss]]))
    else:
        if i_episode % 10 == 0: 
            print("episode\ttime\t")
        print("\t".join([str(i_episode), str(time)[:-3]]))


exit(1)
