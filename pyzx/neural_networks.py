import torch
import torch.nn as nn
import torch.nn.functional as F

# if gpu is to be used
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

from .utils import make_into_list

class DQN(nn.Module):

    def __init__(self, inputs, outputs, embedding, dropout=None):
        super(DQN, self).__init__()
        self.name = "DQN_" + embedding.name + str(inputs) + 'q'
        layers = []
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
        return - self.layers(x)


class Duel_DQN(nn.Module):

    def __init__(self, inputs, outputs, embedding, fc1=100, fc2=50, dropout=None):
        super(Duel_DQN, self).__init__()
        self.name="Duel_DQN_" + embedding.name + str(inputs) + 'q'
        layers = []
        if inputs != embedding.inputs:
            layers += [nn.Linear(inputs*inputs, embedding.inputs), nn.ReLU()]
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
        adv = -self.relu(self.fc1_adv(x))
        val = -self.relu(self.fc1_val(x))
        adv = self.fc2_adv(adv)
        val = self.fc2_val(val).expand(x.size(0), self.outputs)
        
        x = val + adv - adv.mean(1).unsqueeze(1).expand(x.size(0), self.outputs)
        #x = -x # Because the ReLU forces val and adv to be positive.
        return x

    def load_state_dict(self, state_dict, strict=True):
        if not strict:
            # Fit the number of inputs (qubits)
            # Fit the number of outputs (actions)
            this_dict = self.state_dict()
            print(state_dict["input_map"])
            input_key = "layers.0.layers.0.weight"
            print(input_key, state_dict[input_key].shape, this_dict[input_key].shape, sep='\t')
            if state_dict[input_key].shape[1] < this_dict[input_key].shape[1]:
                this_dict[input_key][:,state_dict["input_map"]] = state_dict[input_key]
                state_dict[input_key] = this_dict[input_key]
            else:
                state_dict[input_key] = state_dict[input_key][:, state_dict["input_map"]]
            print(state_dict[input_key].shape)
            print(state_dict["output_map"])
            old_output_indices = [i for i in range(self.outputs) if state_dict["output_map"][i] is not None]
            new_output_indices = [s for s in state_dict["output_map"] if s is not None]
            print(old_output_indices, new_output_indices)
            for key in [ "fc2_adv.weight", "fc2_adv.bias"]:
                print(key, state_dict[key].shape, this_dict[key].shape, sep='\t')
                this_dict[key][old_output_indices] = state_dict[key][new_output_indices]
                state_dict[key] = this_dict[key]
                print(state_dict[key].shape)

            del state_dict["output_map"]
            del state_dict["input_map"]
            """ Old code that maps naively
            for key in state_dict.keys():
                if key in this_dict:
                    old_weights = this_dict[key]
                    new_weights = state_dict[key]
                    if old_weights.shape != new_weights.shape:
                        n_dims = len(old_weights.shape)
                        for dim, (old_s, new_s) in enumerate(zip(old_weights.shape, new_weights.shape)):
                            if old_s > new_s:
                                slices = [slice(None) if i != dim else slice(new_s) for i in range(n_dims)]
                                print(key, old_weights.shape, new_weights.shape, old_weights[slices].shape, sep='\t')
                                old_weights[slices] = new_weights
                                #del state_dict[key]
                                state_dict[key] = old_weights
                            elif old_s < new_s:
                                slices = [slice(None) if i != dim else slice(old_s) for i in range(n_dims)]
                                print(key, old_weights.shape, new_weights.shape, new_weights[slices].shape, sep='\t')
                                state_dict[key] = new_weights[slices]"""
        return super().load_state_dict(state_dict, strict=strict)

class FC_Embedding(nn.Module):

    def __init__(self, inputs, outputs, hidden=100, extra_inputs=0):
        super(FC_Embedding, self).__init__()
        self.name = "FC"
        hidden = make_into_list(hidden)
        layers = [layer for in_size, out_size in zip([inputs*inputs+extra_inputs] + hidden, hidden + [outputs]) 
                        for layer in [nn.Linear(in_size, out_size), nn.ReLU()]][:-1]
        self.layers = nn.Sequential(*layers)
        self.inputs = inputs
        self.outputs = outputs

    # Called with either one element to determine next action, or a batch
    # during optimization. Returns tensor([[left0exp,right0exp]...]).
    def forward(self, x):
        x = x.view(x.size(0), -1)
        return self.layers(x*2.-1.)

class Deep_CNN_Embedding(nn.Module):

    def __init__(self, inputs, outputs, kernel_size=None):
        super(Deep_CNN_Embedding, self).__init__()
        self.name = "Deep_CNN"
        if kernel_size is None:
            kernel_size = inputs//3
        self.conv1 = nn.Conv2d(1, 4, kernel_size=kernel_size)
        self.bn1 = nn.BatchNorm2d(4)
        #self.conv2 = nn.Conv2d(4, 8, kernel_size=kernel_size)
        #self.bn2 = nn.BatchNorm2d(8)
        #self.conv3 = nn.Conv2d(8, 8, kernel_size=kernel_size)
        #self.bn3 = nn.BatchNorm2d(8)

        # Number of Linear input connections depends on output of conv2d layers
        # and therefore the input image size, so compute it.
        def conv2d_size_out(size, kernel_size = kernel_size, stride = 1):
            return (size - (kernel_size - 1) - 1) // stride  + 1
        convw = conv2d_size_out(conv2d_size_out(conv2d_size_out(inputs)))
        convh = conv2d_size_out(conv2d_size_out(conv2d_size_out(inputs)))
        linear_input_size = convw * convh * 8
        linear_input_size = conv2d_size_out(inputs)**2 * 4
        self.head = nn.Linear(linear_input_size, outputs)
        self.inputs = inputs
        self.outputs = outputs

    # Called with either one element to determine next action, or a batch
    # during optimization. Returns tensor([[left0exp,right0exp]...]).
    def forward(self, x):
        x = x.view(-1, 1, self.inputs, self.inputs)
        x = F.relu(self.bn1(self.conv1(x)))
        #x = F.relu(self.bn2(self.conv2(x)))
        #x = F.relu(self.bn3(self.conv3(x)))
        return self.head(x.view(x.size(0), -1))

        
class Wide_CNN_Embedding(nn.Module):

    def __init__(self, inputs, outputs):
        super(Wide_CNN_Embedding, self).__init__()
        self.name = "Wide_CNN"
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

class GRU_Embedding(nn.Module):

    def __init__(self, inputs, outputs, layers=1, bidirectional=True):
        super().__init__()
        self.name = "GRU"
        self.inputs = inputs
        self.outputs = outputs
        self.gru = nn.GRU(inputs, outputs, num_layers=layers, bidirectional=bidirectional)
    
    def forward(self, x):
        #print(x.shape)
        batch = x.shape[0]
        x = x.view(-1, batch, self.inputs)
        #x = x.view(batch, -1, self.inputs)
        #print(x.shape)
        output, hn = self.gru(x)
        #print(output.shape, hn.shape)
        #print(hn[:,-1, :].shape)
        return hn[-1, :, :]


class RNN_Embedding(nn.Module):

    def __init__(self, inputs, outputs, hidden=100, max_length=None):
        super(RNN_Embedding, self).__init__()
        self.name = "RNN"
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
            hidden = torch.zeros((1, 1, self.hidden), device=device)
            for i in range(x.shape[-1]):
                inputs = x[j, :, i]
                inputs = inputs.view(1, 1, -1)
                attn_weights = F.softmax(self.attn(torch.cat((inputs[0], hidden[0]), 1)), dim=1)
                attn_applied = torch.bmm(attn_weights.unsqueeze(0), x[j:j+1])
                output = torch.cat((inputs[0], attn_applied[0]), 1)
                output = self.attn_combine(output).unsqueeze(0)

                output = F.relu(output)
                output, hidden = self.gru(output, hidden)
            output = self.out(hidden[0])
            outputs.append(output)
        return torch.cat(outputs, 0)