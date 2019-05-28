import datetime
import time as time_lib
import numpy as np
import matplotlib.pyplot as plt
from collections import namedtuple
from itertools import count
import queue
import torch.multiprocessing as mp

import torch
import torch.optim as optim
import torch.nn.functional as F
import torchvision.transforms as T
from torch.utils.tensorboard import SummaryWriter

np.random.seed(1337)
# if gpu is to be used
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
#device = torch.device("cpu")
#print("cuda" if torch.cuda.is_available() else "cpu")

Transition = namedtuple('Transition',
                        ('state', 'action', 'next_state', 'reward'))

from .replay_memory import ReplayMemory
from .neural_networks import DQN, Duel_DQN, FC_Embedding, CNN_Embedding, RNN_Embedding

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
        self.allow_perm = allow_perm
        self.beta = beta

    def create_test_set(self, size, fitting=False):
        return [self._create_instance(fitting) for _ in range(size)]

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
        return self.matrix#torch.Tensor(np.expand_dims(self.matrix.data, axis=0)).to(device)
    
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

class EGreedySelector():

    def __init__(self, n_actions, policy_net, EPS_START, EPS_END, EPS_DECAY):
        self.n_actions = n_actions
        self.policy_net = policy_net
        self.EPS_START = EPS_START
        self.EPS_END = EPS_END
        self.EPS_DECAY = EPS_DECAY
        self.steps_done = 0

    def select_action(self, state):
        sample = np.random.rand()
        eps_threshold = self.EPS_END + (self.EPS_START - self.EPS_END) * np.exp(-1. * self.steps_done / self.EPS_DECAY)
        if sample > eps_threshold:
            with torch.no_grad():
                # t.max(1) will return largest column value of each row.
                # second column on max result is index of where max element was
                # found, so we pick action with the larger expected reward.
                return self.policy_net(state).max(1)[1].view(1, 1)
        else:
            return torch.tensor([[np.random.choice(self.n_actions)]], device=device, dtype=torch.long)

class SoftmaxSelector():

    def __init__(self, n_actions, policy_net, TEMP):
        self.n_actions = n_actions
        self.policy_net = policy_net
        self.TEMP = TEMP
        self.steps_done = 0

    def select_action(self, state):
        print(state)
        Q_values = self.policy_net(state)
        # I need to add a minus because the Q-values are negative
        probs = F.softmax(-Q_values/self.TEMP, dim=1).data[0].cpu().numpy()
        choice = np.random.choice(self.n_actions, p=probs)
        return choice #torch.tensor([[choice]], device=device, dtype=torch.long)

class AllActionSelector():

    def __init__(self, n_actions, policy_net=None):
        self.n_actions = n_actions
        self.last_action = -1
        self.steps_done = 0
    
    def select_action(self, state):
        self.last_action = (self.last_action + 1) % self.n_actions
        return self.last_action #torch.tensor([[self.last_action]], device=device, dtype=torch.long)

class RLAgent():

    BATCH_SIZE = 64
    GAMMA = 0.
    TARGET_UPDATE = 10

    def __init__(self, environment, policy_net, target_net, selector, memory, optimizer):
        self.environment = environment
        self.policy_net = policy_net
        self.target_net = target_net
        self.selector = selector
        self.iter_selector = AllActionSelector(self.selector.n_actions)
        self.memory = memory
        self.steps_done = 0
        self.writer = SummaryWriter()
        self.optimizer = optimizer
    
            
    
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
        MAX_QUEUE_SIZE = self.environment.n_actions**2
        start_time = datetime.datetime.now()
        total_steps = -1
        for n_gates in range(1, max_gates+1):
            self.steps_done = 0
            self.memory.reset()
            # TODO fill memory
            n_episodes = 0
            dataset_start = datetime.datetime.now()
            losses = []
            self.environment.max_gates = n_gates
            test_set = self.environment.create_test_set(test_size, fitting=True)

            for i_episode in count():#range(num_episodes):
                total_steps += 1
                # Initialize the environment and state
                self.environment.reset()
                state = self.environment.get_state()
                state_queue = mp.Queue(MAX_QUEUE_SIZE)
                state_queue.put((Transition(None, None, state, None), 0))
                ext_queue = mp.Queue(MAX_QUEUE_SIZE)
                sim_process = mp.Process(target=simulate, args=(self.environment, self.selector, n_gates, state_queue, ext_queue))#, self.policy_net.state_dict()))
                sim_process.start()
                self.selector.steps_done += 1
                busy = True
                while sim_process.is_alive() or not ext_queue.empty(): #TODO fix deadlock 
                    #print("alive")
                    if not ext_queue.empty():
                        print(state_queue.qsize(), ext_queue.qsize())
                        state, action, next_state, reward = ext_queue.get()
                        state = torch.tensor([state.data]).cuda(non_blocking=True)
                        action = torch.tensor([[action]]).cuda(non_blocking=True)
                        if next_state is not None:
                            next_state = torch.tensor([next_state.data]).cuda(non_blocking=True)
                        reward = torch.tensor([reward]).cuda(non_blocking=True)
                        # TODO move all tensors to cuda if available.
                        transition = Transition(state, action, next_state, reward)
                        self.memory.push(100, transition)
                        if periodic_update or np.random.rand(1) < 0.5:
                            loss = self.optimize_model(self.policy_net, self.target_net)
                        else:
                            loss = self.optimize_model(self.target_net, self.policy_net)
                        if loss: losses.append(loss)
                    else:
                        time_lib.sleep(0.0001)
                sim_process.close()
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
                time_passed = datetime.datetime.now( ) - start_time
                if i_episode % 10 == 0:
                    counts = self.test(test_set, n_gates+1)
                    if counts:
                        self.writer.add_scalar("cnots_done", len(counts)/test_size, total_steps)
                        self.writer.add_scalar("cnots_mean", np.mean(counts), total_steps)
                        self.writer.add_scalar("cnots_min", min(counts), total_steps)
                        self.writer.add_scalar("cnots_max", max(counts), total_steps)
                        if len(counts) == test_size: 
                            counts= np.asarray(counts)
                            self.writer.add_histogram("cnots_hist", counts, total_steps)#, bins=np.arange(n_gates+1))
                            break
                    else:
                        self.writer.add_scalar("cnots_done", 0, total_steps)
                    print(n_gates, i_episode, time_passed, loss, len(counts)/test_size)
                else:
                    print(n_gates, i_episode, time_passed, loss)
                """"
                for t in range(n_gates+1):#count():
                    # Select and perform an action
                    action = self.selector.select_action(state, self.steps_done)
                    next_state, reward, done, _ = self.environment.step(action.item())
                    reward = torch.tensor([reward], device=device)

                    # These are new items, so first add them with a rediculous error so they are picked first
                    # Store the transition in memory
                    self.memory.push(100, Transition(state, action, next_state, reward))

                    # Move to the next state
                    state = next_state

                    # Perform one step of the optimization (on the target network)
                    if periodic_update or np.random.rand(1) < 0.5:
                        loss = self.optimize_model(self.policy_net, self.target_net)
                    else:
                        loss = self.optimize_model(self.target_net, self.policy_net)
                    if loss: losses.append(loss)
                    self.steps_done += 1
                    if done:
                        break
                """ 
            self.writer.add_scalar("total_gates", n_gates, total_steps)
            self.writer.add_scalar("total_episodes", i_episode-n_episodes, total_steps)
            #self.writer.add_scalar("total_time", datetime.datetime.now() - dataset_start, total_steps)

    def test(self, test_set, max_steps):
        counts = []
        for m, n in test_set:
            self.environment.start(m)
            state = self.environment.get_state()
            for t in range(max_steps):
                # Select and perform an action
                state = torch.tensor([state.data], device=device)
                action = self.policy_net(state).max(1)[1].view(1, 1)
                state, reward, done, _ = self.environment.step(action)
                if done:
                    overhead = (t+1)/n
                    counts.append(overhead)
                    break
        return counts


def simulate(environment, selector, max_steps, state_queue, ext_queue):#, policy_dict):
#print("Simulate", state_queue.qsize(), ext_queue.qsize(), end=" ", flush=True)
    print(".", end=" ", flush=True)
    action = 0
    do_iter_actions = not state_queue.full()
    transition, n_steps  = state_queue.get()
    _, _, state, _ = transition
    if n_steps != 0:
        ext_queue.put(transition)
    if state is not None:
        if n_steps < max_steps: # We can still do more steps
            if do_iter_actions: # First few iterations pick all actions in parallel
                while not state_queue.full() and action < selector.n_actions:# and state is not None:
                    environment.start(state)
                    next_state, reward, done, _ = environment.step(action)
                    #reward = torch.tensor([reward], device=device)
                    #state_queue.put((Transition(state, torch.tensor([[action]], device=device), next_state, reward), n_steps+1))
                    if done: 
                        next_state = None
                    transition = Transition(state, action, next_state, reward)
                    #print(transition, n_steps+1)
                    state_queue.put((transition, n_steps+1))
                    action += 1
            else: # Otherwise, pick the action according to the policy
                environment.start(state)
                action = selector.select_action(torch.tensor([state.data], device="cpu"))
                next_state, reward, done, _ = environment.step(action)
                if done:
                    next_state = None
                #reward = torch.tensor([reward], device=device)
                state_queue.put((Transition(state, action, next_state, reward), n_steps+1))
        if not state_queue.empty(): # empty the queue when all steps are done.
            simulate(environment, selector, max_steps, state_queue, ext_queue)#, policy_dict)

def main(*args):
    EPS_START = 0.9
    EPS_END = 0.05
    EPS_DECAY = 200
    TEMP = 10
    selector_class, selector_args = SoftmaxSelector, [TEMP]
    #selector, args = EGreedySelector, [EPS_START, EPS_END, EPS_DECAY]

    hidden = [1000, 500, 100]
    memory_size = 10000
    test_size = 50
    max_gates = 10
    n_qubits = 3
    prioritized = True
    dropout = 0.5
    mode = "dueling"
    architecture = create_architecture(LINE, n_qubits=n_qubits)

    env = Environment(architecture, max_gates, test_size)
    n_actions = env.n_actions
    n_qubits = env.n_qubits

    if mode == "dueling":
        embedding = FC_Embedding(n_qubits, hidden[-2], hidden[:-2], device=device)
        cpu_embedding = FC_Embedding(n_qubits, hidden[-2], hidden[:-2], device="cpu")
        #embedding = CNN_Embedding(n_qubits, hidden[-2])
        #embedding = RNN_Embedding(n_qubits, hidden[-2], hidden=hidden[0], device=device)
        #cpu_embedding = RNN_Embedding(n_qubits, hidden[-2], hidden=hidden[0], device="cpu")
    else:
        embedding = FC_Embedding(n_qubits, n_actions, hidden, device=device)
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
        network = lambda i, o, e, d, device=device: Duel_DQN(i, o, e, fc1=hidden[-2], fc2=hidden[-1], dropout=d, device=device)
        #loss_function = F.mse_loss

    print("Environment created", architecture.name, n_qubits, n_actions)

    policy_net = network(n_qubits, n_actions, embedding, dropout, device=device).to(device)
    print("Created policy net")
    target_net = network(n_qubits, n_actions, embedding, dropout, device=device).to(device)
    print("Created target net")
    target_net.load_state_dict(policy_net.state_dict())
    cpu_net = network(n_qubits, n_actions, cpu_embedding, dropout, device="cpu").to("cpu")
    print("Created cpu net")
    cpu_net.eval()
    target_net.eval()
    policy_net.train()
    policy_net.share_memory()
    target_net.share_memory()

    optimizer = optim.RMSprop(policy_net.parameters())
    memory = ReplayMemory(memory_size, prioritized=prioritized)
    print("Created replay memory")

    periodic_update = periodic_update or not double_dqn

    select_action = selector_class(n_actions, cpu_net, *selector_args)

    agent = RLAgent(env, policy_net, target_net, select_action, memory, optimizer)
    print("Start training")
    agent.train(periodic_update, max_gates, test_size)

    val_set = env.create_test_set(test_size, fitting=False)
    counts = agent.test(val_set, n_qubits**2+1)
    baseline = []
    for m, n in val_set:
        cn = CNOT_tracker(n_qubits)
        gauss(GENETIC_GAUSS_MODE, m.copy(), architecture, full_reduce=True, x=cn)
        baseline.append(cn.count_cnots()/n)
    counts = np.asarray(counts)
    baseline = np.asarray(baseline)
    agent.writer.add_histogram("final_baseline_hist", baseline)#, bins=np.arange(n_gates+1))
    agent.writer.add_scalar("final_baseline_mean", np.mean(baseline))
    if len(counts)>0:
        agent.writer.add_scalar("final_cnots_done", len(counts)/len(val_set))
        agent.writer.add_scalar("final_cnots_mean", np.mean(counts))
        agent.writer.add_scalar("final_cnots_min", min(counts))
        agent.writer.add_scalar("final_cnots_max", max(counts))
        agent.writer.add_histogram("final_cnots_hist", counts)#, bins=np.arange(n_gates+1))
    else:
        agent.writer.add_scalar("final_cnots_done", 0)

#main()
#exit(42)