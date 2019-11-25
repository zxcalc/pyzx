from . import Circuit
from .gates import *
from fractions import Fraction

def parse_qsim(data):
    """Produces a :class:`Circuit` based on a .qsim description of a circuit."""
    lines = data.strip().splitlines()

    try:
        qcount = int(lines.pop(0))
    except ValueError:
        raise ValueError('First line should be qubit count')

    gates = []

    for l in lines:
        l = l.strip()
        if l == '': continue
        gdesc = l.split(' ')
        q = int(gdesc[2])
        if gdesc[1] == 'rz':
            phase = float(gdesc[3]) / math.pi
            gates.append(ZPhase(target = q, phase = Fraction(phase)))
        elif gdesc[1] == 'hz_1_2':
            gates.append(ZPhase(target = q, phase = Fraction(1,4)))
            gates.append(XPhase(target = q, phase = Fraction(1,2)))
            gates.append(ZPhase(target = q, phase = Fraction(-1,4)))
        elif gdesc[1] == 'x_1_2':
            gates.append(XPhase(target = q, phase = Fraction(1,2)))
        elif gdesc[1] == 'y_1_2':
            gates.append(XPhase(target = q, phase = Fraction(1,2)))
            gates.append(ZPhase(target = q, phase = Fraction(1,2)))
            gates.append(XPhase(target = q, phase = Fraction(-1,2)))
        elif gdesc[1] == 'fs':
            q1 = int(gdesc[3])
            theta = float(gdesc[4]) / math.pi
            phi = float(gdesc[5]) / math.pi
            gates.append(FSim(Fraction(theta), Fraction(phi), q, q1))

    c = Circuit(qcount)
    c.gates = gates
    return c