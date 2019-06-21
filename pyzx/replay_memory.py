import numpy as np
import queue
import torch.multiprocessing as mp

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

        sampling_probabilities = priorities / self.total()
        is_weight = np.power(self.n_entries * sampling_probabilities, -self.beta)
        is_weight /= is_weight.max()
        return batch, idxs, is_weight

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

class PrioritizedStorage:
    write = 0
    e = 0.01
    a = 0.6
    beta = 0.4
    beta_increment_per_sampling = 0.001

    def __init__(self, capacity):
        self.capacity = capacity
        self.errors = np.zeros(capacity)
        self.data = np.zeros(capacity, dtype=object)
        self.n_entries = 0

    def _get_priority(self, error):
        return (error + self.e) ** self.a

    def sample(self, n):
        self.beta = np.min([1., self.beta + self.beta_increment_per_sampling])

        probs = self.errors/self.total()
        choices = np.random.choice(self.capacity, n, p=probs)
        batch = [self.data[i] for i in choices]
        idxs = choices.tolist()
        priorities = [self.errors[i] for i in choices]

        sampling_probabilities = priorities / self.total()
        is_weight = np.power(self.n_entries * sampling_probabilities, -self.beta)
        is_weight /= is_weight.max()
        return batch, idxs, is_weight

    def total(self):
        return self.errors.sum()

    # store priority and sample
    def add(self, error, sample):
        p = self._get_priority(error)
        self.data[self.write] = sample
        self.update(self.write, p)

        self.write = (self.write + 1) % self.capacity
        self.n_entries = min(self.n_entries + 1, self.capacity-1)

    # update priority
    def update(self, idx, p):
        self.errors[idx] = p

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
        return [self.data[i] for i in choices], choices, np.ones_like(choices)
    
    def __len__(self):
        return len(self.data)

class Queue(object):

    def __init__(self, capacity):
        self.capacity = capacity
        self.q = queue.Queue(self.capacity)

    def add(self, error, sample):
        self.q.put(sample)

    def update(self, idx, p):
        pass
    
    def sample(self, batch_size):
        choices = [i for i in range(batch_size)]
        if len(self) >= batch_size:
            return [self.q.get() for _ in range(batch_size)], choices, np.ones_like(choices)
        return [], choices, np.ones_like(choices)

    def __len__(self):
        return self.q.qsize()
        
class ReplayMemory(object):

    def __init__(self, capacity, prioritized=False):
        self.capacity = capacity
        self.prioritized = prioritized
        self.reset()

    def push(self, error, sample):
        """Saves a transition."""
        self.memory.add(error, sample)

    def sample(self, batch_size):
        return self.memory.sample(batch_size)
    
    def update(self, errors, idxs):
        for i, idx in enumerate(idxs):
            self.memory.update(idx, errors[i])

    def reset(self):
        if self.prioritized == "sumtree":
            self.memory = SumTree(self.capacity)
        elif self.prioritized == "forgetfull":
            self.memory = Queue(self.capacity)
        elif self.prioritized:
            self.memory = PrioritizedStorage(self.capacity)
        else:
            self.memory = Storage(self.capacity)


    def __len__(self):
        return len(self.memory)