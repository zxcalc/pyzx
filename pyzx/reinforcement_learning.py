import datetime
import numpy as np
import matplotlib.pyplot as plt
from collections import namedtuple
from itertools import count

import torch
import torch.optim as optim
import torch.nn.functional as F
import torchvision.transforms as T
from torch.utils.tensorboard import SummaryWriter

np.random.seed(1337)
# if gpu is to be used
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(device)

Transition = namedtuple('Transition',
                        ('state', 'action', 'next_state', 'reward'))

from .replay_memory import ReplayMemory
from .neural_networks import DQN, Duel_DQN, FC_Embedding, CNN_Embedding, RNN_Embedding

from .routing.architecture import create_architecture, SQUARE, LINE, FULLY_CONNNECTED
from .routing.cnot_mapper import gauss, GENETIC_GAUSS_MODE
from .parity_maps import build_random_parity_map, CNOT_tracker
from .linalg import Mat2

class Environment():

    def __init__(self, architecture, max_gates, allow_perm=True, beta=0.4):
        self.n_qubits = architecture.n_qubits
        self.architecture = architecture
        self.max_gates = max_gates
        self.actions = [(v1, v2) for v1, v2 in architecture.graph.edges()] + [(v2, v1) for v1, v2 in architecture.graph.edges()] 
        self.n_actions = len(self.actions)
        self.allow_perm = allow_perm
        self.beta = beta
        self.reset()

    def create_test_set(self, size, fitting=False):
        return [self._create_instance(fitting) for _ in range(size)]

    def _create_instance(self, fitting=True):
        n_cnots = np.random.choice(self.max_gates)+1
        if fitting:
            matrix = build_random_parity_map(self.n_qubits, n_cnots, architecture=self.architecture)
        else:
            matrix = build_random_parity_map(self.n_qubits, n_cnots)
        if self.allow_perm:
            matrix = matrix[:, np.random.permutation(matrix.shape[1])]
        return Mat2(matrix.tolist()), n_cnots

    def reset(self, fitting=True):
        self.matrix = self._create_instance(fitting)[0]

    def start(self, matrix):
        self.matrix = matrix.copy()
        return self.get_state()


    def get_state(self):
        #return torch.Tensor(np.expand_dims(self.matrix.data, axis=0)).to(device)
        return self.matrix
    
    def step(self, action):
        control, target = self.actions[action]
        self.matrix.row_add(control, target)
        reward, done = self.reward()
        if done: return None, reward, done, []
        return self.get_state(), reward, done, []

    def reward(self):
        distance = len([v for row in self.matrix.data for v in row if v == 1]) - self.n_qubits
        done = len([v for row in self.matrix.data for v in row if v == 0]) == self.n_qubits * (self.n_qubits - 1)
        diag = [self.matrix.data[i][i]==1 for i in range(self.n_qubits)]
        if not self.allow_perm:
            done = done and all(diag)
        reward = -(distance/self.n_qubits**2)**self.beta
        #reward = torch.Tensor(np.asarray(reward, dtype=np.float32)).to(device)
        return reward, done

    def copy(self):
        return Environment(self.architecture, self.max_gates, self.allow_perm, self.beta)

class EGreedySelector():

    def __init__(self, n_actions, policy_net, EPS_START, EPS_END, EPS_DECAY, device="cuda"):
        self.n_actions = n_actions
        self.policy_net = policy_net
        self.EPS_START = EPS_START
        self.EPS_END = EPS_END
        self.EPS_DECAY = EPS_DECAY
        self.device=device

    def select_action(self, state, steps_done):
        sample = np.random.rand()
        eps_threshold = self.EPS_END + (self.EPS_START - self.EPS_END) * np.exp(-1. * steps_done / self.EPS_DECAY)
        if sample > eps_threshold:
            with torch.no_grad():
                # t.max(1) will return largest column value of each row.
                # second column on max result is index of where max element was
                # found, so we pick action with the larger expected reward.
                #return self.policy_net(state).max(1)[1].view(1, 1)
                state = torch.tensor([state.data], dtype=torch.float, device=self.device)
                return self.policy_net(state).max(1)[1].view(1, 1).item()
        else:
            #return torch.tensor([[np.random.choice(self.n_actions)]], device=device, dtype=torch.long)
            return np.random.choice(self.n_actions)

class SoftmaxSelector():

    def __init__(self, n_actions, policy_net, TEMP, device="cuda"):
        self.n_actions = n_actions
        self.policy_net = policy_net
        self.TEMP = TEMP
        self.device=device

    def select_action(self, state, steps_done):
        state = torch.tensor([state.data], dtype=torch.float, device=self.device)
        Q_values = self.policy_net(state)
        # I need to add a minus because the Q-values are negative
        probs = F.softmax(-Q_values/self.TEMP, dim=1).data[0].cpu().numpy()
        choice = np.random.choice(self.n_actions, p=probs)
        #return torch.tensor([[choice]], device=device, dtype=torch.long)
        return choice

class RLAgent():

    BATCH_SIZE = 64
    GAMMA = 0.9
    TARGET_UPDATE = 100

    def __init__(self, environment, policy_net, target_net, selector, memory, optimizer, topk=1):
        self.environment = environment
        self.policy_net = policy_net
        self.target_net = target_net
        self.selector = selector
        self.memory = memory
        self.steps_done = 0
        self.writer = SummaryWriter()
        self.optimizer = optimizer
        self.topk = topk
    
    def optimize_model(self, policy_net, target_net):
        batch_size = self.BATCH_SIZE
        if len(self.memory) < batch_size: 
            return
        transitions, idxs, is_weights = self.memory.sample(batch_size)
        batch = Transition(*zip(*transitions))

        non_final_mask = torch.tensor(tuple(map(lambda s: s is not None,
                                            batch.next_state)), device=device, dtype=torch.uint8)
        next_states = [s for s in batch.next_state if s is not None]
        if next_states:
            non_final_next_states = torch.cat(next_states)
                                                    
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
        if len(next_states) > 0:
            if True: # TODO Fix this boolean double_dqn
                next_state_actions = policy_net(non_final_next_states).max(1, keepdim=True)[1]
                next_state_values[non_final_mask] = target_net(non_final_next_states).gather(1, next_state_actions).flatten()
            else:
                next_state_values[non_final_mask] = target_net(non_final_next_states).max(1)[0].detach()
        # Compute the expected Q values
        expected_state_action_values = (next_state_values * self.GAMMA) + reward_batch

        # Compute Huber loss
        loss = F.smooth_l1_loss(state_action_values, expected_state_action_values.unsqueeze(1), reduction="none")
        # Update the memory with the new losses
        self.memory.update(loss.data.cpu().numpy(), idxs)
        # Adjuste the losses with the importance sampling weights
        loss = torch.mul(torch.tensor(is_weights, device=device, dtype=torch.float), loss).mean()

        # Optimize the model
        self.optimizer.zero_grad()
        loss.backward()
        for param in policy_net.parameters():
            param.grad.data.clamp_(-1, 1)
        self.optimizer.step()
        return loss

    def train(self, periodic_update, max_gates, test_size = 1):
        start_time = datetime.datetime.now()
        total_steps = -1
        for n_gates in range(1, max_gates+1):
            self.steps_done = 0
            all_counts = []
            self.memory.reset()
            # TODO fill memory
            n_episodes = 0
            dataset_start = datetime.datetime.now()
            losses = []
            self.environment.max_gates = n_gates
            test_set = self.environment.create_test_set(test_size, fitting=True)
            #for i_episode in count():#range(num_episodes):
            for i_episode, state in enumerate(train_set_generator(self.environment)):
                total_steps += 1
                # Initialize the environment and state
                #self.environment.reset()
                #state = self.environment.get_state()
                start = datetime.datetime.now()
                for t in range(n_gates+1):#count():
                    # Select and perform an action
                    action = self.selector.select_action(state, self.steps_done)
                    self.environment.start(state)
                    next_state, reward, done, _ = self.environment.step(action)
                    #state, action, next_state, reward = simulate_run(state, self.environment, self.selector, self.steps_done)
                    #print(np.asarray(state.data) - np.asarray(next_state.data))
                    torch_state = torch.tensor([state.data], dtype=torch.float, device=device)
                    action = torch.tensor([[action]], dtype=torch.long, device=device)
                    torch_next_state = torch.tensor([next_state.data], dtype=torch.float, device=device) if next_state is not None else None
                    reward = torch.tensor([reward], dtype=torch.float, device=device)

                    # These are new items, so first add them with a rediculous error so they are picked first
                    # Store the transition in memory
                    self.memory.push(100, Transition(torch_state, action, torch_next_state, reward))

                    # Move to the next state
                    state = next_state

                    # Perform one step of the optimization (on the target network)
                    if periodic_update or np.random.rand(1) < 0.5:
                        loss = self.optimize_model(self.policy_net, self.target_net)
                    else:
                        loss = self.optimize_model(self.target_net, self.policy_net)
                    if loss: losses.append(loss)
                    self.steps_done += 1
                    if next_state is None:
                        break
                # Update the target network, copying all weights and biases in DQN
                if periodic_update and i_episode % self.TARGET_UPDATE == 0:
                    self.target_net.load_state_dict(self.policy_net.state_dict())
                time = datetime.datetime.now() - start_time
                self.writer.add_scalar("gates", n_gates, total_steps)
                self.writer.add_scalar("episode", i_episode, total_steps)
                loss = torch.stack(losses).mean().item() if losses else np.nan
                if not losses:
                    n_episodes += 1
                self.writer.add_scalar("loss", loss, global_step=total_steps)
                losses = []
                
                if i_episode % 10 == 0:
                    test_time = datetime.datetime.now()
                    counts = self.test(test_set, n_gates+1)
                    test_time = datetime.datetime.now() - test_time
                    all_counts.append(len(counts)/test_size)
                    if len(all_counts) > 10:
                        print(np.convolve(all_counts, np.ones((100,))/100, mode="valid")[-10:])
                    if counts:
                        self.writer.add_scalar("cnots_done", len(counts)/test_size, total_steps)
                        self.writer.add_scalar("cnots_mean", np.mean(counts), total_steps)
                        self.writer.add_scalar("cnots_min", min(counts), total_steps)
                        self.writer.add_scalar("cnots_max", max(counts), total_steps)
                        print(str(n_gates) + "/" + str(max_gates), time, i_episode, loss, len(counts)/test_size, np.mean(counts), min(counts), max(counts), "\t\t", test_time)
                        if len(counts) == test_size: 
                            counts= np.asarray(counts)
                            self.writer.add_histogram("cnots_hist", counts, total_steps)#, bins=np.arange(n_gates+1))
                            break
                    else:
                        self.writer.add_scalar("cnots_done", 0, total_steps)
                        print(str(n_gates) + "/" + str(max_gates), time, i_episode, loss, len(counts)/test_size, "\t\t", test_time)
                else:
                    print(str(n_gates) + "/" + str(max_gates), time, i_episode, loss)
            
            self.writer.add_scalar("total_gates", n_gates, total_steps)
            self.writer.add_scalar("total_episodes", i_episode-n_episodes, total_steps)
            #print(n_gates, total_steps)
            #self.writer.add_scalar("total_time", datetime.datetime.now() - dataset_start, total_steps)

    def dfs_find_solution(self, state, k=1, max_steps=None):
        if k == 1:
            return self.greedy_find_solution(state, max_steps)
        if max_steps == 0:
            return None
        state_tensor = torch.tensor([state.data], dtype=torch.float, device=device)
        best_actions = self.policy_net(state_tensor).topk(k, dim=1)
        max_steps = None if max_steps is None else max_steps-1
        for i in best_actions.indices[0]:
            self.environment.start(state)
            action = i.item()
            next_state, reward, done, _ = self.environment.step(action)
            if done:
                return [self.environment.actions[action]]
            next_actions = self.dfs_find_solution(next_state, k=k, max_steps=max_steps)
            if next_actions is not None: # a solution was found
                return [self.environment.actions[action]] + next_actions
        return None

    def greedy_find_solution(self, state, max_steps=None):
        iterator = count() if max_steps is None else range(max_steps)
        actions = []
        self.environment.start(state)
        state = self.environment.get_state()
        for t in iterator:
            # Select and perform an action
            state = torch.tensor([state.data], dtype=torch.float, device=device)
            action = self.policy_net(state).max(1)[1].view(1, 1)
            state, reward, done, _ = self.environment.step(action.item())
            actions.append(self.environment.actions[action])
            if done:
                return actions
        return None

    def bfs_find_solution(self, state, k=1, max_steps=None):
        if k == 1:
            return self.greedy_find_solution(state, max_steps)
        queue = []
        queue.append((state, []))
        while queue:
            state, prev_actions = queue.pop(0)
            #print(prev_actions)
            if max_steps is None or len(prev_actions) < max_steps:
                state_tensor = torch.tensor([state.data], dtype=torch.float, device=device)
                best_actions = self.policy_net(state_tensor).topk(k, dim=1)
                #print(action.indices)
                for i in best_actions.indices[0]:
                    action = i.item()
                    self.environment.start(state)
                    next_state, reward, done, _ = self.environment.step(action)
                    queue.append((next_state, prev_actions + [self.environment.actions[action]]))
                    if done:
                        return prev_actions + [self.environment.actions[action]]
        return None

    def test(self, test_set, max_steps=None):
        counts = []
        for m, n in test_set:
            #cnots = self.greedy_find_solution(m, k=self.topk, max_steps=max_steps)
            #cnots = self.bfs_find_solution(m, k=self.topk, max_steps=max_steps)
            cnots = self.dfs_find_solution(m, k=self.topk, max_steps=max_steps)
            if cnots is not None:
                overhead = len(cnots)/n
                counts.append(overhead)
        return counts

def simulate_run(matrix, environment, selector, steps_done):
    state = environment.start(matrix)
    action = selector.select_action(state, steps_done)
    next_state, reward, done, _ = environment.step(action)
    #if next_state is not None:
    #    print(np.sum(np.asarray(matrix.data) - np.asarray(next_state.data)))
    return Transition(matrix, action, next_state, reward)

def train_set_generator(environment, n=None):
    iterator = count() if n is None else range(n)
    for _ in iterator:
        environment.reset()
        yield environment.get_state()


def main(*args):
    EPS_START = 0.9
    EPS_END = 0.05
    EPS_DECAY = 200
    TEMP = 10
    selector_class, selector_args = SoftmaxSelector, [TEMP]
    #selector, args = EGreedySelector, [EPS_START, EPS_END, EPS_DECAY]

    hidden = [100, 50, 10]
    memory_size = 10000
    test_size = 50
    n_qubits = 4
    max_gates = int(n_qubits**2/np.log(n_qubits))+1
    prioritized = False
    dropout = 0.5
    mode = "dqn"
    hidden = hidden[:1]
    architecture = create_architecture(LINE, n_qubits=n_qubits)

    env = Environment(architecture, max_gates, test_size)
    n_actions = env.n_actions
    n_qubits = env.n_qubits
    topk = 2#int(0.3*n_actions)+2

    if mode == "dueling":
        embedding = FC_Embedding(n_qubits, hidden[-2], hidden[:-2])
        #embedding = CNN_Embedding(n_qubits, hidden[-2])
        #embedding = RNN_Embedding(n_qubits, hidden[-2], hidden=hidden[0])
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
        network = lambda i, o, e, d: Duel_DQN(i, o, e, fc1=hidden[-2], fc2=hidden[-1], dropout=d)
        #loss_function = F.mse_loss

    print("Environment created", architecture.name, n_qubits, n_actions)

    policy_net = network(n_qubits, n_actions, embedding, dropout).to(device)
    target_net = network(n_qubits, n_actions, embedding, dropout).to(device)
    target_net.load_state_dict(policy_net.state_dict())
    target_net.eval()
    policy_net.train()

    optimizer = optim.RMSprop(policy_net.parameters())
    memory = ReplayMemory(memory_size, prioritized=prioritized)

    periodic_update = periodic_update or not double_dqn

    select_action = selector_class(n_actions, policy_net, *selector_args)

    agent = RLAgent(env, policy_net, target_net, select_action, memory, optimizer, topk)
    agent.train(periodic_update, max_gates, test_size)

    val_set = env.create_test_set(test_size, fitting=False)
    val_time = datetime.datetime.now()
    counts = agent.test(val_set, n_qubits**2+1)
    val_time = datetime.datetime.now() - val_time
    baseline_time = datetime.datetime.now()
    baseline = []
    for m, n in val_set:
        cn = CNOT_tracker(n_qubits)
        gauss(GENETIC_GAUSS_MODE, m.copy(), architecture, full_reduce=True, x=cn)
        baseline.append(cn.count_cnots()/n)
    baseline_time = datetime.datetime.now() - baseline_time
    counts = np.asarray(counts)
    baseline = np.asarray(baseline)
    agent.writer.add_histogram("final_baseline_hist", baseline)#, bins=np.arange(n_gates+1))
    agent.writer.add_scalar("final_baseline_mean", np.mean(baseline))
    print("\nbaseline:")
    print(1.0, baseline_time, np.mean(baseline), min(baseline), max(baseline))
    print("\n" + mode + ":")
    if len(counts)>0:
        agent.writer.add_scalar("final_cnots_done", len(counts)/len(val_set))
        agent.writer.add_scalar("final_cnots_mean", np.mean(counts))
        agent.writer.add_scalar("final_cnots_min", min(counts))
        agent.writer.add_scalar("final_cnots_max", max(counts))
        agent.writer.add_histogram("final_cnots_hist", counts)#, bins=np.arange(n_gates+1))
        print(len(counts)/len(val_set), val_time, np.mean(counts), min(counts), max(counts))
    else:
        agent.writer.add_scalar("final_cnots_done", 0)
        print(0.0, val_time, 0., np.nan, np.nan)
