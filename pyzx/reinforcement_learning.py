import datetime
import time as time_lib
import numpy as np
import matplotlib.pyplot as plt
from collections import namedtuple
from itertools import count
import gc

import torch
import torch.optim as optim
import torch.nn.functional as F
import torchvision.transforms as T
from torch.utils.tensorboard import SummaryWriter
import torch.multiprocessing as mp

np.random.seed(1337)
# if gpu is to be used
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
device = torch.device("cpu")
print(device)

Transition = namedtuple('Transition',
                        ('state', 'action', 'next_state', 'reward'))

from .replay_memory import ReplayMemory
from .neural_networks import DQN, Duel_DQN, FC_Embedding, RNN_Embedding, Wide_CNN_Embedding, Deep_CNN_Embedding, GRU_Embedding

from .routing.architecture import create_architecture, SQUARE, LINE, FULLY_CONNNECTED, CIRCLE
from .routing.cnot_mapper import gauss, GENETIC_GAUSS_MODE, GENETIC_STEINER_MODE, STEINER_MODE, GAUSS_MODE
from .parity_maps import build_random_parity_map, CNOT_tracker
from .linalg import Mat2
from .action_selection import *
from .utils import make_into_list

class Environment():

    def __init__(self, architecture, max_gates, allow_perm=True, beta=0.3):
        self.n_qubits = architecture.n_qubits
        self.architecture = architecture
        self.max_gates = max_gates
        self.actions = [(v1, v2) for v1, v2 in architecture.graph.edges()] + [(v2, v1) for v1, v2 in architecture.graph.edges()] 
        self.distances = [[architecture.distances["upper"][0][(i,j)][0] for i in range(self.n_qubits)] for j in range(self.n_qubits)]
        self.n_actions = len(self.actions)
        self.allow_perm = allow_perm
        self.beta = beta
        self.reset()

    def create_test_set(self, size, fitting=False, exact=False):
        return [self._create_instance(fitting, exact) for _ in range(size)]

    def _create_instance(self, fitting=True, exact=False, **kwargs):
        if not exact:
            n_cnots = np.random.choice(self.max_gates)+1
        else:
            n_cnots = self.max_gates
        if fitting:
            matrix = build_random_parity_map(self.n_qubits, n_cnots, architecture=self.architecture, **kwargs)
        else:
            matrix = build_random_parity_map(self.n_qubits, n_cnots, **kwargs)
        if self.allow_perm:
            matrix = matrix[:, np.random.permutation(matrix.shape[1])]
        return Mat2(matrix.tolist()), n_cnots

    def reset(self, fitting=True, exact=True):
        circuit = CNOT_tracker(self.n_qubits)
        self.matrix = self._create_instance(fitting, exact, circuit=circuit)[0]
        cnots = [(g.control, g.target) for g in circuit.gates if hasattr(g, "name") and g.name == "CNOT"]
        self.ground_truth = [self.actions.index(cnot) for cnot in reversed(cnots)]
        self.gt_index = 0

    def start(self, matrix):
        self.matrix = matrix.copy()
        return self.get_state()


    def get_state(self):
        #return torch.Tensor(np.expand_dims(self.matrix.data, axis=0)).to(device)
        return self.matrix
    
    def step(self, action):
        control, target = self.actions[action]
        self.old = self.matrix.copy().data
        self.matrix.row_add(control, target)
        reward, done = self.reward()
        if done: return None, reward, done, []
        return self.get_state(), reward, done, []

    def reward(self):
        distance = len([v for row in self.matrix.data for v in row if v == 1]) - self.n_qubits
        done = len([v for row in self.matrix.data for v in row if v == 1]) == self.n_qubits
        diag = [self.matrix.data[i][i]==1 for i in range(self.n_qubits)]
        if not self.allow_perm:
            done = done and all(diag)
        if done:
            return 0., done
        reward = distance/self.n_qubits**2
        #reward = 0. if done else 1.
        reward = - reward**self.beta
        return reward, done

    def copy(self):
        return Environment(self.architecture, self.max_gates, self.allow_perm, self.beta)
    
class PermEnvironment():

    def __init__(self, architecture, max_gates):
        self.n_qubits = architecture.n_qubits
        self.architecture = architecture
        self.actions = [i for i in range(self.n_qubits)]
        self.n_actions = len(self.actions)
        self.distances = [[architecture.distances["upper"][0][(i,j)][0] for i in range(self.n_qubits)] for j in range(self.n_qubits)]
        #print(*self.distances, sep="\n")
        self.max_gates = max_gates
        self.reset()

    def create_test_set(self, size, fitting=False, exact=False):
        return [self._create_instance(fitting, exact) for _ in range(size)]

    def _create_instance(self, fitting=False, exact=False, **kwargs):
        if not exact:
            n_cnots = np.random.choice(self.max_gates)+1
        else:
            n_cnots = self.max_gates
        if fitting:
            matrix = build_random_parity_map(self.n_qubits, n_cnots, architecture=self.architecture, **kwargs)
        else:
            matrix = build_random_parity_map(self.n_qubits, n_cnots, **kwargs)
        return Mat2(matrix.tolist()), n_cnots

    def reset(self, fitting=False, exact=False):
        return self.start(self._create_instance(fitting, exact)[0], [-1]*self.n_qubits)

    def start(self, matrix, prev_actions=None):
        if prev_actions is None: # actions are hidden in the matrix
            self.prev_actions = matrix.data[-1]
            self.matrix = Mat2(matrix.data[:self.n_qubits])
            self.original_matrix = self.matrix.copy()
        else:
            self.matrix = matrix.copy()
            self.original_matrix = matrix.copy()
            self.prev_actions = [a for a in prev_actions]
        cn = CNOT_tracker(self.n_qubits)
        gauss(STEINER_MODE, self.matrix.copy(), self.architecture, full_reduce=True, x=cn)
        self.original_score = cn.count_cnots()
        return self.get_state()


    def get_state(self):
        #return torch.Tensor(np.expand_dims(self.matrix.data, axis=0)).to(device)
        dists = [[self.n_actions if c == -1 else r[c] for c in self.prev_actions] for r in self.distances]
        return Mat2(self.matrix.data + dists + [self.prev_actions]) # Mat2 for compatibilty
    
    def step(self, action):
        if action in self.prev_actions:
            raise ValueError("The given action is already taken.")
        i = self.prev_actions.index(-1)
        self.prev_actions[i] = action
        if -1 not in self.prev_actions:
            self.matrix = Mat2([[r[c] for c in self.prev_actions] for r in self.original_matrix.data])
            reward = self.reward()
            return None, reward, True, []
        return self.get_state(), 0., False, []

    def reward(self, return_cnots=False):
        cn = CNOT_tracker(self.n_qubits)
        gauss(STEINER_MODE, self.matrix.copy(), self.architecture, full_reduce=True, x=cn)
        cnots = cn.count_cnots()
        maximize = False
        if self.original_score == 0:
            reward = 1. if cnots == 0 else 0.
        else:
            #reward = max(0., self.original_score - cnots)/self.original_score
            reward = min(self.original_score, cnots)/self.original_score
        if not maximize:
            reward = 1. - reward
        reward = reward ** 0.4
        #print(reward, self.original_score - cnots/self.original_score, self.original_score, cnots)
        if return_cnots:
            return reward, cnots
        return reward
        #return self.original_score - cn.count_cnots()
        #return - cn.count_cnots() / (self.original_score + 0.00001) # deals with original score is 0

    def copy(self):
        return Environment(self.architecture, self.max_gates, self.allow_perm, self.beta)

class RLAgent():

    BATCH_SIZE = 64
    GAMMA = 0.9
    TARGET_UPDATE = 100

    def __init__(self, environment, policy_net, target_net, selector, memory, optimizer, scheduler, topk=1, n_threads=0, multi_step=None):
        self.environment = environment
        self.policy_net = policy_net
        self.target_net = target_net
        self.selector = make_into_list(selector)
        self.memory = memory
        self.steps_done = 0
        self.writer = SummaryWriter()
        self.optimizer = optimizer
        self.optimizer_start_state = optimizer.state_dict()
        self.topk = topk
        self.n_threads = len(selector)
        self.scheduler = scheduler
        self.multi_step = self.n_threads > 1 if multi_step is None else multi_step

    def save(self, path, **kwargs):
        save_dict = kwargs
        save_dict["model_state_dict"] = self.policy_net.state_dict()
        save_dict["optimizer_state_dict"] = self.optimizer.state_dict()
        save_dict["replay_memory"] = self.memory 
        save_dict["topk"] = self.topk
        save_dict["environment"] = self.environment
        torch.save(save_dict, path)
    
    @staticmethod
    def load(path, target_net, policy_net, optimizer, selector, scheduler, environment=None, memory=None, topk=None):
        d = torch.load(path)
        #print(d.keys())
        #print(d["environment"].architecture.name)
        #print(d["model_state_dict"].keys())
        #print(target_net.state_dict().keys())
        strict=True
        if environment is None:
            environment = d["environment"]
        else:
            if environment.architecture.name != d["environment"].architecture.name:
                output_indices = [ d["environment"].actions.index(action) if action in d["environment"].actions else None for action in environment.actions]
                print(output_indices)
                q1 = environment.n_qubits
                q2 = d["environment"].n_qubits
                if q1 > q2:
                    q1, q2 = q2, q1
                larger_matrix = [[i+q2*j for i in range(q2)] for j in range(q2)]
                print(*larger_matrix, sep="\n")
                input_indices = sum([[larger_matrix[i][j] for j in range(q1)] for i in range(q1)], [])
                print(input_indices)
                d["model_state_dict"]["input_map"] = input_indices
                d["model_state_dict"]["output_map"] = output_indices
                strict=False
        # TODO check if neural network architecture match regardless of in-output for transfer learning
        # TODO rebuild architecture from pathname for continued training
        if memory is None:
            memory = d["replay_memory"]
        if topk is None:
            topk = d["topk"]
        target_net.load_state_dict(d["model_state_dict"], strict=strict)
        policy_net.load_state_dict(target_net.state_dict())
        target_net.eval()
        policy_net.train()
        # TODO keep total_steps, test_set, optimizer_state_dict if needed.
        return RLAgent(environment, policy_net, target_net, selector, memory, optimizer, scheduler, topk=topk), environment

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
        #print(action_batch.shape)
        #print(state_batch.shape)
        #print(policy_net(state_batch).shape)
        state_action_values = policy_net(state_batch).gather(1, action_batch)

        if self.multi_step:
            loss = F.smooth_l1_loss(state_action_values, reward_batch.unsqueeze(1), reduction="none")  
        else:
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
        #gradient clipping
        for param in policy_net.parameters():
            param.grad.data.clamp_(-1, 1)
        self.optimizer.step()
        return loss

    def update(self, transition, periodic_update):
        state, action, next_state, reward = transition
        torch_state = torch.tensor([state.data], dtype=torch.float, device=device)
        action = torch.tensor([[action]], dtype=torch.long, device=device)
        torch_next_state = torch.tensor([next_state.data], dtype=torch.float, device=device) if next_state is not None else None
        reward = torch.tensor([reward], dtype=torch.float, device=device)

        # These are new items, so first add them with a rediculous error so they are picked first
        # Store the transition in memory
        self.memory.push(100, Transition(torch_state, action, torch_next_state, reward))

        # Perform one step of the optimization (on the target network)
        if periodic_update or np.random.rand(1) < 0.5:
            return self.optimize_model(self.policy_net, self.target_net)
        else:
            return self.optimize_model(self.target_net, self.policy_net)
                    
    def write_episode_performance(self, start_time, n_gates, max_gates, total_steps, i_episode, losses, test_set, test_func=None):
        test_func = self.test if test_func is None else test_func
        time = datetime.datetime.now() - start_time
        self.writer.add_scalar("gates", n_gates, total_steps)
        self.writer.add_scalar("episode", i_episode, total_steps)
        loss = torch.stack(losses).mean().item() if losses else np.nan
        self.writer.add_scalar("loss", loss, global_step=total_steps)
        #self.scheduler.step(loss)
        test_size = len(test_set)
        print_string = [str(n_gates) + "/" + str(max_gates), time, i_episode, loss]
        counts = None
        if i_episode % 1000 == 0:
            test_time = datetime.datetime.now()
            counts = test_func(test_set, n_gates+1)
            test_time = datetime.datetime.now() - test_time
            print_string.append(len(counts)/test_size)
            if counts:
                self.writer.add_scalar("cnots_done", len(counts)/test_size, total_steps)
                self.writer.add_scalar("cnots_mean", np.mean(counts), total_steps)
                self.writer.add_scalar("cnots_min", min(counts), total_steps)
                self.writer.add_scalar("cnots_max", max(counts), total_steps)
                print_string += [np.mean(counts), min(counts), max(counts)]
                self.scheduler.step(len(counts)/test_size)
                if len(counts) == test_size: 
                    counts= np.asarray(counts)
                    self.writer.add_histogram("cnots_hist", counts, total_steps)#, bins=np.arange(n_gates+1))
            else:
                self.writer.add_scalar("cnots_done", 0, total_steps)
            print_string += ["\t\t", test_time]
            # Manually do garbage collection pass
            #gc.collect()
            if device == "cuda": torch.cuda.empty_cache()
            # Track PyTorch memory usage.
            torch_memory_usage = 0
            torch_cpu_memory = 0
            torch_gpu_memory = 0
            for obj in gc.get_objects():
                try:
                    if torch.is_tensor(obj) or (hasattr(obj, 'data') and torch.is_tensor(obj.data)):
                        memory = np.prod(obj.size())
                        torch_memory_usage += memory
                        if obj.get_device() < 0:
                            torch_cpu_memory += memory
                        else:
                            torch_gpu_memory += memory
                        #print(type(obj), obj.size())
                except:
                    pass
            self.writer.add_scalar("torch_memory", torch_memory_usage, total_steps)
            self.writer.add_scalar("torch_gpu_memory", torch_gpu_memory, total_steps)
            self.writer.add_scalar("torch_cpu_memory", torch_cpu_memory, total_steps)
            print_string += ["\t", torch_memory_usage]
        print(*print_string)
        return counts

    def train(self, periodic_update, max_gates, test_size = 1, val_start=1., start_n_gates=1, val_end=1.):
        start_time = datetime.datetime.now()
        total_steps = -1
        val_step = (val_end - val_start)/(max_gates-1)
        if self.n_threads == 1:
            first_action_selector = AllActionSelector(self.environment.n_actions, self.policy_net, multi_select=True)
            selector = self.selector[0]
            for n_gates in range(start_n_gates, max_gates+1):
                self.writer.add_scalar("val_start", val_start, total_steps)
                self.steps_done = 0
                self.optimizer.load_state_dict(self.optimizer_start_state)
                self.scheduler._reset()
                self.memory.reset()
                # TODO fill memory
                n_episodes = 0
                dataset_start = datetime.datetime.now()
                losses = []
                self.environment.max_gates = n_gates
                test_set = self.environment.create_test_set(test_size, fitting=True, exact=True)
                #for i_episode in count():#range(num_episodes):
                for i_episode, state in enumerate(train_set_generator(self.environment)):
                    total_steps += 1
                    # Initialize the environment and state
                    start = datetime.datetime.now()
                    min_steps = n_gates + 1
                    for first_action in first_action_selector.select_action(state, self.steps_done):
                        self.environment.start(state)
                        next_state, reward, done, _ = self.environment.step(first_action)
                        transition = Transition(state, first_action, next_state, reward)
                        loss = self.update(transition, periodic_update)
                        if loss is not None: losses.append(loss)
                        for t in range(n_gates):#count():
                            if next_state is None:
                                min_steps = min(t+1, min_steps)
                                break
                            # Select and perform an action
                            transition = simulate_run(next_state, self.environment, selector, self.steps_done+t+1)
                            loss = self.update(transition, periodic_update)
                            if loss: losses.append(loss)
                            _, _, next_state, _ = transition
                    self.steps_done += min_steps
                    # Update the target network, copying all weights and biases in DQN
                    if periodic_update and i_episode % self.TARGET_UPDATE == 0:
                        self.target_net.load_state_dict(self.policy_net.state_dict())
                    counts = self.write_episode_performance(start_time, n_gates, max_gates, total_steps, i_episode, losses, test_set)   
                    if not losses:
                        n_episodes += 1
                    losses = []         
                    if counts is not None:
                        val_perc = len(counts)/test_size
                        if val_perc >= val_start and i_episode > 0:
                            break
                
                self.writer.add_scalar("total_gates", n_gates, total_steps)
                self.writer.add_scalar("total_episodes", i_episode-n_episodes, total_steps)
                self.save("checkpoints/RLAgent_"+self.policy_net.name+"_phase_"+str(n_gates)+'_'+str(start_time), total_steps=total_steps, test_set=test_set)
                val_start += val_step
                #print(n_gates, total_steps)
                #self.writer.add_scalar("total_time", datetime.datetime.now() - dataset_start, total_steps)
        else:
            MAX_QUEUE_SIZE = self.memory.capacity
            ext_queue = mp.Queue(MAX_QUEUE_SIZE)
            # Setup the threads
            consumer_event = mp.Event()
            pipes = [mp.Pipe(duplex=False) for _ in range(self.n_threads)]
            barrier = mp.Barrier(self.n_threads+1)
            producers = [mp.Process(target=simulate_process2, args=(self.environment, self.selector[i], max_gates, ext_queue, consumer_event, pipes[i][0], barrier, i, start_n_gates)) for i in range(self.n_threads)]
            [p.start() for p in producers]
            i_episode = 0
            n_gates = start_n_gates
            val_start += (n_gates - 1)*val_step
            losses = []
            test_set = None
            n_episodes = 0
            update = True # TODO only update if policy has changed.
            while any([p.is_alive() for p in producers]):
                self.writer.add_scalar("val_start", val_start, total_steps)
                if consumer_event.is_set():
                    if test_set is None:  # Generate testset if it doesnt exist
                        self.environment.max_gates = n_gates
                        test_set = self.environment.create_test_set(test_size, fitting=True, exact=True)
                    
                    if ext_queue.empty():
                        if barrier.n_waiting == self.n_threads: # New episode.
                            # Log the data
                            counts = self.write_episode_performance(start_time, n_gates, max_gates, total_steps, i_episode, losses, test_set)
                            if not losses: n_episodes += self.n_threads
                            losses = []         
                            if counts is not None:
                                #all_counts.append(len(counts)/test_size)
                                #if len(all_counts) > 10:
                                #    print(np.convolve(all_counts, np.ones((100,))/100, mode="valid")[-10:])
                                lr = float(self.optimizer.param_groups[0]["lr"])
                                if len(counts)/test_size >= val_start or lr < 1e-5:
                                    consumer_event.clear()
                                    self.scheduler._reset()
                                    self.memory.reset()
                                    self.optimizer.load_state_dict(self.optimizer_start_state)
                                    self.writer.add_scalar("total_gates", n_gates, total_steps)
                                    self.writer.add_scalar("total_episodes", i_episode-n_episodes, total_steps)
                                    self.save("checkpoints/RLAgent_"+self.policy_net.name+"_phase_"+str(n_gates)+'_'+start_time.strftime("%m-%d-%Y_%H-%M-%S"), total_steps=total_steps, test_set=test_set)
                                    i_episode = 0
                                    n_gates += 1
                                    val_start += val_step
                                    test_set = None
                                    self.steps_done = 0
                                    n_episodes = 0
                            i_episode += self.n_threads
                            total_steps += self.n_threads
                            #print(barrier.n_waiting, barrier.parties)
                            barrier.wait()
                        else: # The producers are still simulating, you just consumed it too fast.
                            #print(barrier.n_waiting)
                            time_lib.sleep(0.01)
                    else:
                        # Get the transistion, make into cuda and add to the memory
                        #print("Q:", ext_queue.qsize())
                        transition, thread, t_steps = ext_queue.get(False)
                        loss = self.update(transition, periodic_update)
                        self.steps_done += 1
                        if periodic_update and i_episode % self.TARGET_UPDATE == 0:
                            self.target_net.load_state_dict(self.policy_net.state_dict())
                            update = True
                            
                        if loss: 
                            losses.append(loss)
                            if update:
                                update=False
                                # update the state_dict on the producer side
                                model_dict = self.policy_net.cpu().state_dict()
                                for i, p in enumerate(pipes):
                                    if p[0].poll(): # If something is still in the pipe, remove it.
                                        try:
                                            p[0].recv() # It was already read
                                        except: 
                                            pass
                                    p[1].send(model_dict)
                                if device == "cuda":
                                    self.policy_net.cuda()
                if n_gates > max_gates:
                    print("Done, terminating all producers.")
                    [p.terminate() for p in producers]
                    [p.join() for p in producers]
                    print(any([p.is_alive() for p in producers]))
                #print("end", barrier.n_waiting, barrier.parties)
                #barrier.wait()
            print("Done training!")
                        
    def train2(self, periodic_update, test_size = 1, val_start= 1.):
        start_time = datetime.datetime.now()
        total_steps = -1
        selector = self.selector[0]
        self.steps_done = 0
        n_episodes = 0
        losses = []
        test_set = self.environment.create_test_set(test_size, fitting=False, exact=False)
        for i_episode, state in enumerate(train_set_generator(self.environment, fitting=False, exact=False)):
            total_steps += 1
            min_steps = 0
            # Initialize the environment and state
            next_state = self.environment.start(state)
            transitions = []
            for t in range(self.environment.n_actions):#count():
                min_steps += 1
                # Select and perform an action
                transition = simulate_run(next_state, self.environment, selector, self.steps_done+t+1)
                transitions.append(transition)
                _, _, next_state, _ = transition
            accum_reward = 0
            for state, action, next_state, reward in reversed(transitions):
                accum_reward = reward + self.GAMMA * accum_reward
                transition = Transition(state, action, next_state, accum_reward)
                loss = self.update(transition, periodic_update)
                if loss: losses.append(loss)
            self.steps_done += min_steps
            # Update the target network, copying all weights and biases in DQN
            if periodic_update and i_episode % self.TARGET_UPDATE == 0:
                self.target_net.load_state_dict(self.policy_net.state_dict())
            counts = self.write_episode_performance(start_time, -1, -1, total_steps, i_episode, losses, test_set, self.test2)   
            if not losses:
                n_episodes += 1
            losses = []         
            if counts is not None:
                val_perc = len(counts)/test_size
                if val_perc > val_start:
                    break
        
        self.writer.add_scalar("total_episodes", i_episode-n_episodes, total_steps)
        self.save("checkpoints/RLAgent_"+self.policy_net.name+"_perm_"+start_time.strftime("%m-%d-%Y_%H-%M-%S"), total_steps=total_steps, test_set=test_set)
        #print(n_gates, total_steps)
        #self.writer.add_scalar("total_time", datetime.datetime.now() - dataset_start, total_steps)

                        


    def dfs_find_solution(self, state, k=1, max_steps=None, end_time=None):
        if k == 1: # The branching factor is 1, so this is a line, this is equal to the greedy solution
            return self.greedy_find_solution(state, max_steps)
        if max_steps == 0: # It took too long to find a solution
            return None
        if end_time is not None:
            if end_time < datetime.datetime.now():
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
            next_actions = self.dfs_find_solution(next_state, k=k, max_steps=max_steps, end_time=end_time)
            if next_actions is not None: # a solution was found :)
                return [self.environment.actions[action]] + next_actions
        return None # We did not find a solution :(

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

    def test(self, test_set, max_steps=None, topk=None, max_time=None):
        if topk is None:
            topk = self.topk
        counts = []
        for m, n in test_set:
            self.environment.start(m)
            _, done = self.environment.reward()
            if not done:
                if max_time is not None:
                    end_time = datetime.datetime.now() + max_time
                else: 
                    end_time = None
                cnots = self.dfs_find_solution(m, k=topk, max_steps=max_steps, end_time=end_time)
                #cnots = self.greedy_find_solution(m, k=self.topk, max_steps=max_steps)
                #cnots = self.bfs_find_solution(m, k=self.topk, max_steps=max_steps)
            else:
                cnots = []
            if cnots is not None:
                overhead = metric(len(cnots),n)
                counts.append(overhead)
        return counts
        
    def test2(self, test_set, max_steps=None, better=1.):
        counts = []
        for m, n in test_set:
            state = self.environment.start(m, [-1]*self.environment.n_actions)
            prev_actions = []
            done = False
            while not done:
                # Select and perform an action
                allowed_actions = [i for i in range(self.environment.n_actions) if i not in prev_actions]
                state = torch.tensor([state.data], dtype=torch.float, device=device)
                action = allowed_actions[self.policy_net(state)[0][allowed_actions].max(0)[1].item()]
                state, reward, done, _ = self.environment.step(action)
                prev_actions.append(action)
            reward, cnots = self.environment.reward(True)
            #cnots = -self.environment.original_score * reward
            #cnots = self.environment.original_score - reward
            overhead = cnots/n
            if cnots <= better * self.environment.original_score:
                counts.append(overhead)
        return counts

def simulate_run(matrix, environment, selector, steps_done, parallel_steps=0):
    action = selector.select_action(matrix, steps_done, environment=environment)
    actions = make_into_list(action) # allows to take parallel steps
    if parallel_steps == 0: 
        actions = actions[:1]
    elif parallel_steps < len(actions): # If the queue is almost full, pick a few random actions.
        choice = np.random.choice(len(actions), parallel_steps, replace=False)
        actions = [actions[i] for i in choice]
    transitions = []
    for action in actions:
        state = environment.start(matrix)
        next_state, reward, done, _ = environment.step(action)
        transitions.append(Transition(matrix, action, next_state, reward))
    if parallel_steps == 0:
        return transitions[0]
    return transitions

def simulate_process(environment, selector, max_gates, consumerQ, consumer_event, policy_pipe, barrier, thread, start_n_gates=1):
    #environment = environment.copy()
    queue_size = 2**min(environment.n_actions, 10)
    for n_gates in range(start_n_gates, max_gates+1):
        print(thread, "start", n_gates, max_gates)
        state_queue = mp.Queue(queue_size)
        consumer_event.set()
        environment.max_gates = n_gates
        max_steps = n_gates + 1
        #environment.reset()
        #state = environment.get_state()
        #state_queue.put((Transition(None, None, state, None), 0))
        t_steps = 0
        while consumer_event.is_set():
            #print(thread, end=" ", flush=True)
            if policy_pipe.poll(0.001):
                #print(thread, "reading")
                policy_dict = policy_pipe.recv()
                selector.update_policy(policy_dict)
            if state_queue.empty(): # finished simulating, get a new start state
                barrier.wait() # Wait for the other threads to finish simulating
                t_steps = 0
                environment.reset()
                state = environment.get_state()
                state_queue.put((Transition(None, None, state, None), 0))
            else:
                transition, n_steps  = state_queue.get()            
                _, _, state, _ = transition
                if n_steps != 0:
                    try:
                        consumerQ.put((transition, thread, n_steps), False)
                    except:
                        # Try again later
                        state_queue.put((transition, n_steps))
                        time_lib.sleep(0.1)
                        continue
                if state is not None:
                    if n_steps < max_steps: # We can still do more steps
                        space = queue_size - state_queue.qsize() # always at least 1.
                        transitions = simulate_run(state, environment, selector, t_steps, space)
                        for new_transition in transitions:
                            state_queue.put((new_transition, n_steps+1))
                        t_steps += 1
        print(thread, "done") # Consumer is ready for the next phase.
        #barrier.wait()
        #print(thread, "emptying queue")
        while not consumerQ.empty(): # empty the shared queue
            try:
                consumerQ.get(False)
            except: # Queue is already empty
                break
    print(thread, "finished")

def simulate_process2(environment, selector, max_gates, consumerQ, consumer_event, policy_pipe, barrier, thread, start_n_gates=1):
    #environment = environment.copy()
    queue_size = 2**min(environment.n_actions, 10)
    for n_gates in range(start_n_gates, max_gates+1):
        print(thread, "start", n_gates, max_gates)
        state_queue = mp.Queue(queue_size)
        consumer_event.set()
        environment.max_gates = n_gates
        max_steps = n_gates + 1
        t_steps = 0
        while consumer_event.is_set():
            #print(thread, end=" ", flush=True)
            if policy_pipe.poll(0.001):
                #print(thread, "reading")
                policy_dict = policy_pipe.recv()
                selector.update_policy(policy_dict)
            if state_queue.empty(): # finished simulating, get a new start state
                barrier.wait() # Wait for the other threads to finish simulating
                t_steps = 0
                environment.reset()
                state = environment.get_state()
                transitions = []
                done = False
                for n_steps in range(max_steps):
                    transition = simulate_run(state, environment, selector, t_steps, 0)
                    transitions.append(transition)
                    _, _, state, _ = transition
                    if state is None:
                        done = True
                        break
                accum_reward = 0.
                gamma = 0.9
                if not done:
                    with torch.no_grad():
                        state = torch.tensor([state.data], dtype=torch.float, device=device)
                        accum_reward = selector.policy_net(state).max(1)[0].item()
                    step_upperbound = n_gates + max_steps
                    reward_upperbound = sum([-gamma**n for n in range(step_upperbound-1)])
                    if accum_reward >= 0.  or accum_reward < reward_upperbound: #The state is not trained yet
                        accum_reward = reward_upperbound
                    #accum_reward = -1.
                    #pass
                for n_steps, transition in reversed(list(enumerate(transitions))):
                    #print(thread, n_steps, accum_reward)
                    state, action, next_state, reward = transition
                    accum_reward = reward + gamma * accum_reward
                    new_transition = Transition(state, action ,next_state, accum_reward)
                    try:
                        consumerQ.put((new_transition, thread, n_steps+1), False)
                    except:
                        # Try again later
                        state_queue.put((new_transition, n_steps+1))
            else:
                transition, n_steps  = state_queue.get()            
                try:
                    consumerQ.put((transition, thread, n_steps), False)
                except:
                    # Try again later
                    state_queue.put((transition, n_steps))
                    time_lib.sleep(0.1)
        print(thread, "done") # Consumer is ready for the next phase.
        #barrier.wait()
        #print(thread, "emptying queue")
        while not consumerQ.empty(): # empty the shared queue
            try:
                consumerQ.get(False)
            except: # Queue is already empty
                break
    print(thread, "finished")


def train_set_generator(environment, n=None, fitting=True, exact=True):
    iterator = count() if n is None else range(n)
    for _ in iterator:
        environment.reset(fitting, exact)
        yield environment.get_state()


def main2(*args):
    #architecture = create_architecture("rigetti_16q_aspen")
    architecture = create_architecture(SQUARE, n_qubits=9)
    n_qubits = architecture.n_qubits
    max_gates = 50
    env = PermEnvironment(architecture, max_gates)
    n_actions = env.n_actions

    selectors = [] # Oracle is not possible, ground truth does not exist
    selectors += [(SoftmaxSelector, [int(p)]) for p in np.random.uniform(1, 500, 1)]
    
    hidden = [128,64,32]
    dropout = 0.5
    learning_rate = 0.001
    prioritized = False
    memory_size = 10000
    test_size = memory_size
    val_start = 1.

    embedding = FC_Embedding(n_qubits, hidden[-2], hidden[:-2], extra_inputs=n_qubits*n_qubits+n_qubits)
    double_dqn = True
    periodic_update = True
    network = lambda i, o, e, d: Duel_DQN(i, o, e, fc1=hidden[-2], fc2=hidden[-1], dropout=d)

    policy_net = network(n_qubits, n_actions, embedding, dropout).to(device)
    target_net = network(n_qubits, n_actions, embedding, dropout).to(device)
    target_net.load_state_dict(policy_net.state_dict())
    target_net.eval()
    policy_net.train()

    optimizer = optim.RMSprop(policy_net.parameters(), lr=learning_rate)
    scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, "min", cooldown=50, factor=0.9, patience=10, verbose=True)
    scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, "max", factor=0.9, patience=10, verbose=True)
    memory = ReplayMemory(memory_size, prioritized=prioritized)

    periodic_update = periodic_update or not double_dqn
    
    def allowed_actions(state):
        prev_actions = state.data[-1]
        return [i for i in range(len(prev_actions)) if i not in prev_actions]

    select_action = [c(n_actions, policy_net, *a, allowed_action_func=allowed_actions, device=device) for c,a in selectors]
    agent = RLAgent(env, policy_net, target_net, select_action, memory, optimizer, scheduler, 1)
    # TODO requires new basic train loop, simulate loop and test function.
    agent.train2(periodic_update, test_size, val_start)

#metric = lambda cn, n: cn/n
metric = lambda cn, n: (cn-n)/n

def main(*args, **kwargs):
    print(args, kwargs)
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Reinforcement learning CNOT circuit resynthesiser")
    parser.add_argument("-f", nargs="+", help="Checkpoint files for the models to load in.")
    parser.add_argument("-e", action="store_true", help="Flag to keep the environment from the given checkpoint file.")
    args = parser.parse_args(*args)
    print(args)
    
    EPS_START = 0.9
    EPS_END = 0.05
    EPS_DECAY = 200
    TEMP = 10
    selector_class, selector_args = SoftmaxSelector, [TEMP]
    selectors = [
        (SoftmaxSelector, [TEMP]),
        (OracleSelector, []),
        (EGreedySelector, [EPS_START, EPS_END, 1000000]),
        (EGreedySelector, [1., 1., 10]),
        (OracleSelector, [])
    ]
    selectors = []
    #selectors += [(EGreedySelector, [EPS_START, p, 10000]) for p in np.random.uniform(0.001, 0.1, 2)]
    selectors += [(EGreedySelector, [EPS_START, p, 5]) for p in np.random.uniform(0.01, 0.1, 3)] #t_steps reset after each episode.
    
    #selectors += [(EGreedySelector, [EPS_START, p, 10000]) for p in np.random.uniform(0.5, 0.75, 3)]
    #selectors += [(EGreedySelector, [1., p, 3]) for p in np.random.uniform(0.01, 0.1, 3)]
    selectors += [(SoftmaxSelector, [int(p)]) for p in np.random.uniform(1, 500, 2)]
    selectors += [(OracleSelector, []) for p in range(5)]

    hidden = [32]*3#[128, 64, 32]
    memory_size = 10000
    test_size = 10000
    n_qubits = 2
    max_gates = int(n_qubits**2/np.log(n_qubits))+1
    prioritized = False
    dropout = 0.
    learning_rate = 1e-3
    val_start = 0.99
    val_end = val_start #- 0.1
    mode = "dueling"
    architecture = create_architecture(LINE, n_qubits=n_qubits)

    env = Environment(architecture, max_gates, test_size)
    n_actions = env.n_actions
    n_qubits = env.n_qubits
    topk = 1

    #hidden = [h*2 for h in hidden]

    if mode == "dueling":
        embedding = FC_Embedding(n_qubits, hidden[-2], hidden[:-2])
        #embedding = Deep_CNN_Embedding(n_qubits, hidden[-1])
        #embedding = GRU_Embedding(n_qubits, hidden[-2])
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

    optimizer = optim.RMSprop(policy_net.parameters(), lr=learning_rate)
    #scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, "min", cooldown=500, factor=0.9, patience=10, verbose=True)
    scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, "max", factor=0.9, patience=10, verbose=True)
    memory = ReplayMemory(memory_size, prioritized=prioritized)

    periodic_update = periodic_update or not double_dqn

    #select_action = selector_class(n_actions, policy_net, *selector_args, device=device)
    select_action = [c(n_actions, policy_net, *a, device=device) for c,a in selectors]

    agents = []
    if args.f is None:
        agent = RLAgent(env, policy_net, target_net, select_action, memory, optimizer, scheduler, topk)
        agent.train(periodic_update, max_gates, test_size, val_start, val_end=val_end)
        load_files = [None]
    else:
        load_files = make_into_list(args.f)
        keep_env = args.e
        print(load_files, keep_env)
        env = env if not keep_env else None
        if len(load_files) == 1:
            load_file = load_files[0]
            continue_training = input("Continue training?") in ["y", "Y"]
            if continue_training:
                learning_rate_s = input("Learning rate:") 
                learning_rate = float(learning_rate_s) if learning_rate_s else learning_rate
                optimizer = optim.RMSprop(policy_net.parameters(), lr=learning_rate)
                scheduler.optimizer = optimizer
                start_n_gates = int(input("Which n_gates to start at?"))
            agent, env = RLAgent.load(load_file, target_net, policy_net, optimizer, select_action, scheduler, environment=env)
            if continue_training:
                agent.train(periodic_update, max_gates, test_size, val_start, val_end=val_end, start_n_gates=start_n_gates)
                print("Done transfer learning/continued training from", load_file)
            load_files = [None]
        else:
            agent, env = RLAgent.load(load_files[0], target_net, policy_net, optimizer, select_action, scheduler, environment=env)
            #load_files[0] = None


    print(max_gates, env.max_gates)
    env.max_gates = n_qubits**2#max_gates
    max_steps = n_qubits**2+3


    print("Creating test set...")
    val_set = env.create_test_set(test_size, fitting=False)
    print("Results:")
    baseline_mode = STEINER_MODE
    print("\nTesting on baseline...", baseline_mode)
    baseline_time = datetime.datetime.now()
    baseline = []
    if True or n_qubits > 2:
        for m, n in val_set:
            cn = CNOT_tracker(n_qubits)
            gauss(baseline_mode, m.copy(), architecture, full_reduce=True, x=cn)
            baseline.append(metric(cn.count_cnots(),n))
    else:
        print("Skipping baseline")
    baseline_time = datetime.datetime.now() - baseline_time
    if baseline:
        baseline = np.asarray(baseline)
        agent.writer.add_histogram("final_baseline_hist", baseline)#, bins=np.arange(n_gates+1))
        agent.writer.add_scalar("final_baseline_mean", np.mean(baseline))
        print("baseline:")
        print(1.0, baseline_time, np.mean(baseline), min(baseline), max(baseline))
        max_steps = int(max(baseline+1))
        
    baseline_mode = GAUSS_MODE
    print("\nTesting on baseline...", baseline_mode)
    baseline_time = datetime.datetime.now()
    baseline = []
    if True or n_qubits > 2:
        for m, n in val_set:
            cn = CNOT_tracker(n_qubits)
            gauss(baseline_mode, m.copy(), architecture, full_reduce=True, x=cn)
            baseline.append(metric(cn.count_cnots(),n))
    else:
        print("Skipping baseline")
    baseline_time = datetime.datetime.now() - baseline_time
    if baseline:
        baseline = np.asarray(baseline)
        agent.writer.add_histogram("final_baseline_hist", baseline)#, bins=np.arange(n_gates+1))
        agent.writer.add_scalar("final_baseline_mean", np.mean(baseline))
        print("baseline:")
        print(1.0, baseline_time, np.mean(baseline), min(baseline), max(baseline))

    for load_file in load_files:
        if load_file is not None:
            print(load_file)
            agent, env = RLAgent.load(load_file, target_net, policy_net, optimizer, select_action, scheduler, environment=env)

        print("\nTesting with topk=1...")
        val_time = datetime.datetime.now()
        counts = agent.test(val_set, max_steps, topk=1)
        val_time = datetime.datetime.now() - val_time

        counts = np.asarray(counts)
        print(mode + ":")
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


    baseline_mode = GENETIC_STEINER_MODE
    print("\nTesting on baseline...", baseline_mode)
    baseline_time = datetime.datetime.now()
    baseline = []
    if False or n_qubits > 2:
        for m, n in val_set:
            cn = CNOT_tracker(n_qubits)
            gauss(baseline_mode, m.copy(), architecture, full_reduce=True, x=cn, row=False)
            baseline.append(cn.count_cnots()/n)
    else:
        print("Skipping baseline")
    baseline_time = datetime.datetime.now() - baseline_time
    if baseline:
        baseline = np.asarray(baseline)
        agent.writer.add_histogram("final_baseline_hist", baseline)#, bins=np.arange(n_gates+1))
        agent.writer.add_scalar("final_baseline_mean", np.mean(baseline))
        print("baseline:")
        print(1.0, baseline_time, np.mean(baseline), min(baseline), max(baseline))


    for load_file in load_files:
        if load_file is not None:
            print(load_file)
            agent, env = RLAgent.load(load_file, target_net, policy_net, optimizer, select_action, scheduler, environment=env)
        print("\nTesting with topk=2...")
        val_time2 = datetime.datetime.now()
        counts2 = agent.test(val_set, max_steps, topk=2, max_time=datetime.timedelta(seconds=2))
        val_time2 = datetime.datetime.now() - val_time2
        counts2 = np.asarray(counts2)

        print("\n" + mode + " topk=2:")
        if len(counts2)>0:
            agent.writer.add_scalar("final_cnots_done2", len(counts2)/len(val_set))
            agent.writer.add_scalar("final_cnots_mean2", np.mean(counts2))
            agent.writer.add_scalar("final_cnots_min2", min(counts2))
            agent.writer.add_scalar("final_cnots_max2", max(counts2))
            agent.writer.add_histogram("final_cnots_hist2", counts2)#, bins=np.arange(n_gates+1))
            print(len(counts2)/len(val_set), val_time2, np.mean(counts2), min(counts2), max(counts2))
        else:
            agent.writer.add_scalar("final_cnots_done", 0)
            print(0.0, val_time2, 0., np.nan, np.nan)

