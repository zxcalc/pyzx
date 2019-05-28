import torch
import torch.nn as nn
import torch.nn.functional as F

from .utils import make_into_list

class DQN(nn.Module):

    def __init__(self, inputs, outputs, embedding, dropout=None, device="cpu"):
        super(DQN, self).__init__()
        self.device = device
        if inputs != embedding.inputs:
            layers += [nn.Linear(inputs, embedding.inputs), nn.ReLU()]
        if dropout:
            layers += [embedding, nn.Dropout(dropout)]
        else:
            layers.append(embedding)
        if outputs != embedding.outputs:
            layers += [nn.ReLU(), nn.Linear(embedding.outputs, outputs)]
        self.layers = nn.Sequential(*layers)
        self.inputs = inputs
        self.outputs = outputs

    # Called with either one element to determine next action, or a batch
    # during optimization. Returns tensor([[left0exp,right0exp]...]).
    def forward(self, x):
        x = x.view(x.size(0), -1)
        return self.layers(x)


class Duel_DQN(nn.Module):

    def __init__(self, inputs, outputs, embedding, fc1=100, fc2=50, dropout=None, device="cpu"):
        super(Duel_DQN, self).__init__()
        self.device = device
        layers = []
        if inputs != embedding.inputs:
            layers += [nn.Linear(inputs, embedding.inputs), nn.ReLU()]
        layers.append(embedding)
        if fc1 != embedding.outputs:
            layers += [nn.ReLU(), nn.Linear(embedding.outputs, fc1)]
        self.layers = nn.Sequential(*layers)
        self.dropout = nn.Dropout(dropout) if dropout else None
        self.relu = nn.ReLU()

        self.fc1_adv = nn.Linear(fc1, fc2)
        self.fc1_val = nn.Linear(fc1, fc2)

        self.fc2_adv = nn.Linear(fc2, outputs)
        self.fc2_val = nn.Linear(fc2, 1)

        self.inputs = inputs
        self.outputs = outputs

    # Called with either one element to determine next action, or a batch
    # during optimization. Returns tensor([[left0exp,right0exp]...]).
    def forward(self, x):
        x = x.view(x.size(0), -1)
        x = self.relu(self.layers(x))
        if self.dropout:
            x = self.dropout(x)
        adv = self.relu(self.fc1_adv(x))
        val = self.relu(self.fc1_val(x))
        adv = self.fc2_adv(adv)
        val = self.fc2_val(val).expand(x.size(0), self.outputs)
        
        x = val + adv - adv.mean(1).unsqueeze(1).expand(x.size(0), self.outputs)
        return x

class FC_Embedding(nn.Module):

    def __init__(self, inputs, outputs, hidden=100, device="cpu"):
        super(FC_Embedding, self).__init__()
        self.device = device
        hidden = make_into_list(hidden)
        layers = [layer for in_size, out_size in zip([inputs*inputs] + hidden, hidden + [outputs]) 
                        for layer in [nn.Linear(in_size, out_size), nn.ReLU()]][:-1]
        self.layers = nn.Sequential(*layers)
        self.inputs = inputs
        self.outputs = outputs

    # Called with either one element to determine next action, or a batch
    # during optimization. Returns tensor([[left0exp,right0exp]...]).
    def forward(self, x):
        x = x.view(x.size(0), -1)
        return self.layers(x)

class CNN_Embedding(nn.Module):

    def __init__(self, inputs, outputs):
        super(CNN_Embedding, self).__init__()
        self.device = device
        self.layers = []
        size = 0
        stride = 1
        for i in range(2, inputs//2+2):
            l = nn.Conv2d(1,1, kernel_size=i, stride=stride)
            self.layers.append(l)
            size += ((inputs-(i-1)-1)//stride + 1)**2
        self.relu = nn.ReLU()
        self.last = nn.Linear(size, outputs)
        [l.cuda() for l in self.layers]
        self.inputs = inputs
        self.outputs = outputs

    def forward(self, x):
        x = x.view(-1, 1, self.inputs, self.inputs)
        passed = [self.relu(l(x)) for l in self.layers]
        x = torch.cat(passed, 1)
        x = x.view(x.shape[0], -1)
        return self.last(x)

class RNN_Embedding(nn.Module):

    def __init__(self, inputs, outputs, hidden=100, max_length=None, device="cpu"):
        super(RNN_Embedding, self).__init__()
        self.device = device
        self.max_length = max_length if max_length else inputs
        self.hidden = hidden
        self.attn = nn.Linear(hidden+inputs, self.max_length)
        self.attn_combine = nn.Linear(inputs+self.max_length, hidden)
        self.gru = nn.GRU(hidden, hidden)
        self.out = nn.Linear(hidden, outputs)
        self.inputs = inputs
        self.outputs = outputs

    def forward(self, x):
        batch = x.shape[0]
        x = x.view(batch, self.inputs, -1)
        outputs = []
        for j in range(batch):
            hidden = torch.zeros((1, 1, self.hidden), device=self.device)
            for i in range(x.shape[-1]):
                inputs = x[j, :, i]
                inputs = inputs.view(1, 1, -1)
                cat = torch.cat((inputs[0], hidden[0]), 1)
                attn = self.attn(cat)
                attn_weights = F.softmax(attn, dim=1)
                attn_applied = torch.bmm(attn_weights.unsqueeze(0), x[j:j+1])
                output = torch.cat((inputs[0], attn_applied[0]), 1)
                output = self.attn_combine(output).unsqueeze(0)

                output = F.relu(output)
                output, hidden = self.gru(output, hidden)
            output = self.out(hidden[0])
            outputs.append(output)
        return torch.cat(outputs, 0)