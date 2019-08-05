import numpy as np
import torch
import torch.nn.functional as F


class EGreedySelector():

    def __init__(self, n_actions, policy_net, EPS_START, EPS_END, EPS_DECAY, allowed_action_func=None, device="cuda"):
        self.n_actions = n_actions
        self.policy_net = policy_net
        self.EPS_START = EPS_START
        self.EPS_END = EPS_END
        self.EPS_DECAY = EPS_DECAY
        self.device=device
        self.allowed_action_func = allowed_action_func 

    def select_action(self, state, steps_done, **kwargs):
        self.allowed_action_func = self.allowed_action_func if self.allowed_action_func is not None else lambda s: [i for i in range(self.n_actions)]
        sample = np.random.rand()
        eps_threshold = self.EPS_END + (self.EPS_START - self.EPS_END) * np.exp(-1. * steps_done / self.EPS_DECAY)
        allowed_actions = self.allowed_action_func(state)
        if sample > eps_threshold:
            with torch.no_grad():
                # t.max(1) will return largest column value of each row.
                # second column on max result is index of where max element was
                # found, so we pick action with the larger expected reward.
                #return self.policy_net(state).max(1)[1].view(1, 1)
                state = torch.tensor([state.data], dtype=torch.float, device=self.device)
                return allowed_actions[self.policy_net(state)[0][allowed_actions].max(0)[1].item()]
        else:
            #return torch.tensor([[np.random.choice(self.n_actions)]], device=device, dtype=torch.long)
            return np.random.choice(allowed_actions)
    
    def update_policy(self, policy_dict):
        self.policy_net.load_state_dict(policy_dict)

class SoftmaxSelector():

    def __init__(self, n_actions, policy_net, TEMP, allowed_action_func=None, device="cuda"):
        self.n_actions = n_actions
        self.policy_net = policy_net
        self.TEMP = TEMP
        self.device=device
        self.allowed_action_func = allowed_action_func #if allowed_action_func is not None else lambda s: [i for i in range(n_actions)]

    def select_action(self, state, steps_done, **kwargs):
        self.allowed_action_func = self.allowed_action_func if self.allowed_action_func is not None else lambda s: [i for i in range(self.n_actions)]
        allowed_actions = self.allowed_action_func(state)
        with torch.no_grad():
            state = torch.tensor([state.data], dtype=torch.float, device=self.device)
            Q_values = self.policy_net(state)[0][allowed_actions]
            # I need to add a minus because the Q-values are negative
            probs = F.softmax(-Q_values/self.TEMP, dim=0).data.cpu().numpy()
            choice = np.random.choice(allowed_actions, p=probs)
            #return torch.tensor([[choice]], device=device, dtype=torch.long)
            return choice
    
    def update_policy(self, policy_dict):
        self.policy_net.load_state_dict(policy_dict)

class AllActionSelector():

    def __init__(self, n_actions, policy_net=None, multi_select=True, allowed_action_func=None, device="cuda"):
        self.n_actions = n_actions
        self.multi_select = multi_select
        self.current_action = -1
        self.policy_net = policy_net
        self.allowed_action_func = allowed_action_func #if allowed_action_func is not None else lambda s: [i for i in range(n_actions)]

    def select_action(self, state, steps_done, **kwargs):
        self.allowed_action_func = self.allowed_action_func if self.allowed_action_func is not None else lambda s: [i for i in range(self.n_actions)]
        allowed_actions = allowed_action_func(state)
        if self.multi_select:
            return np.random.permutation(allowed_actions)
        return np.random.choice(allowed_actions)
    
    def update_policy(self, policy_dict):
        if self.policy_net is not None:
            self.policy_net.load_state_dict(policy_dict)

class OracleSelector():

    def __init__(self, n_actions, policy_net=None, multi_select=False, device="cuda"):
        self.n_actions = n_actions
        self.multi_select = multi_select
        self.policy_net = policy_net

    def select_action(self, state, steps_done, environment, **kwargs):
        if self.multi_select:
            return environment.ground_truth
        action = environment.ground_truth[environment.gt_index]
        environment.gt_index = (environment.gt_index + 1)%len(environment.ground_truth)
        return action
    
    def update_policy(self, policy_dict):
        if self.policy_net is not None:
            self.policy_net.load_state_dict(policy_dict)
