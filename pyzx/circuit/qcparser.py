from . import Circuit
from .gates import *

def parse_qc(data):
    """Produces a :class:`Circuit` based on a .qc description of a circuit.
    If a Tofolli gate with more than 2 controls is encountered, ancilla qubits are added.
    Currently up to 5 controls are supported."""
    preamble = data[:data.find("BEGIN")].strip().splitlines()
    labels = {}
    for l in preamble:
        if l.startswith('#'): continue
        if l.startswith('.'):
            for v in l[2:].replace(',',' ').strip().split():
                s = v.strip()
                if s not in labels: labels[s] = len(labels)
        else:
            raise TypeError("Unknown Expression: " + l)

    ancillas = {}
    gates = []
    qcount = len(labels)

    for l in data[data.find("BEGIN")+6:data.find("END")].splitlines():
        if l.startswith('#'): continue
        l = l.strip()
        if not l: continue
        try: gname, targets = l.split(' ',1)
        except ValueError:
            raise ValueError("Couldn't parse line {} in file {}".format(l, fname))
        gname = gname.strip().lower()
        targets = [labels[v.strip()] for v in targets.replace(',',' ').strip().split(' ') if v.strip()]
        if len(targets) == 1:
            t = targets[0]
            if gname in ('tof', 't1', 'not', 'x'): gates.append(NOT(t))
            elif gname == 'z': gates.append(Z(t))
            elif gname in ('s', 'p'): gates.append(S(t))
            elif gname in ('s*', 'p*'): gates.append(S(t,adjoint=True))
            elif gname == 't': gates.append(T(t))
            elif gname == 't*': gates.append(T(t,adjoint=True))
            elif gname == 'h': gates.append(HAD(t))
            else:
                raise TypeError("Unknown gate with single target: " + l)
        elif len(targets) == 2:
            c,t = targets
            if gname in ('cnot', 'tof', 't2'):
                gates.append(CNOT(c,t))
            elif gname in ('cz', 'z'):
                gates.append(CZ(c,t))
            else:
                raise TypeError("Unknown gate with control: " + l)
        elif len(targets) == 3:
            c1,c2,t = targets
            if gname in ('t3', 'tof'):
                gates.append(Tofolli(c1,c2,t))
            elif gname in ('ccz', 'z'):
                gates.append(CCZ(c1,c2,t))
            else:
                raise TypeError("Unknown gate with control: " + l)
        else:
            if gname not in ('t4', 't5', 't6', 't7', 'tof'):
                raise TypeError("Unknown gate with multiple controls: " + l)
            *ctrls, t = targets
            if len(ctrls) > 6: raise TypeError("No more than 5 ctrls supported")
            while len(ancillas) < len(ctrls) - 2:
                ancillas[len(ancillas)] = qcount
                qcount += 1
            gates.append(Tofolli(ctrls[0],ctrls[1],ancillas[0]))
            if len(ctrls) == 3:
                gates.append(Tofolli(ctrls[2],ancillas[0],t))
            else:
                gates.append(Tofolli(ctrls[2],ctrls[3],ancillas[1]))
                if len(ctrls) == 4:
                    gates.append(Tofolli(ancillas[0],ancillas[1],t))
                elif len(ctrls) == 5:
                    gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[2]))
                    gates.append(Tofolli(ctrls[4],ancillas[2],t))
                    gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[2]))
                else: # len(ctrls) == 6
                    gates.append(Tofolli(ctrls[4],ctrls[5],ancillas[2]))
                    gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[3]))
                    gates.append(Tofolli(ancillas[2],ancillas[3],t))
                    gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[3]))
                    gates.append(Tofolli(ctrls[4],ctrls[5],ancillas[2]))
                gates.append(Tofolli(ctrls[2],ctrls[3],ancillas[1]))
            gates.append(Tofolli(ctrls[0],ctrls[1],ancillas[0]))

    c = Circuit(qcount)
    c.gates = gates
    return c