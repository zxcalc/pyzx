from fractions import Fraction

from .graph import Graph

class Circuit(object):
	"""Class for representing quantum circuits.

	This is just a wrapper for a list of gates with methods for interconverting
	between different representations of a quantum circuit."""
    def __init__(self, qubit_amount):
        self.q = qubit_amount
        self.gates = []

    @staticmethod
    def from_graph(g):
    	"""Produces a :class:`Circuit` containing the gates of the given ZX-graph.
    	If the ZX-graph is not circuit-like then the behaviour of this function
    	is undefined."""
        c = Circuit(g.qubit_count())
        for r in range(1,g.depth()+1):
            for v in [v for v in g.vertices() if g.row(v)==r]:
                q = g.qubit(v)
                phase = g.phase(v)
                t = g.type(v)
                neigh = [w for w in g.neighbours(v) if g.row(w)<r]
                if len(neigh) != 1:
                    raise TypeError("Graph doesn't seem circuit like: multiple parents")
                n = neigh[0]
                if g.qubit(n) != q:
                    raise TypeError("Graph doesn't seem circuit like: cross qubit connections")
                if g.edge_type(g.edge(n,v)) == 2:
                    c.add_gate("HAD", q)
                if t == 0: #vertex is an output
                    continue
                if t == 1 and phase.denominator == 2:
                    c.add_gate("S", q, adjoint=(phase.numerator==3))
                elif t == 1 and phase.denominator == 4:
                    if phase.numerator in (1,7): c.add_gate("T", q, adjoint=(phase.numerator==7))
                    if phase.numerator in (3,5):
                        c.add_gate("Z", q)
                        c.add_gate("T", q, adjoint=(phase.numerator==3))
                elif phase == 1:
                    if t == 1: c.add_gate("Z", q)
                    else: c.add_gate("NOT", q)
                elif phase != 0:
                    if t == 1: c.add_gate("ZPhase", q, phase=phase)
                    else: c.add_gate("XPhase", q, phase=phase)

                neigh = [w for w in g.neighbours(v) if g.row(w)==r and w<v]
                for n in neigh:
                    t2 = g.type(n)
                    q2 = g.qubit(n)
                    if t == t2:
                        if g.edge_type(g.edge(v,n)) != 2:
                            raise TypeError("Invalid vertical connection between vertices of the same type")
                        if t == 1: c.add_gate("CZ", q, q2)
                        else: c.add_gate("CX", q, q2)
                    else:
                        if g.edge_type(g.edge(v,n)) != 1:
                            raise TypeError("Invalid vertical connection between vertices of different type")
                        if t == 1: c.add_gate("CNOT", q2, q)
                        else: c.add_gate("CNOT", q, q2)
        return c

    @staticmethod
    def from_quipper_file(fname):
    	"""Produces a :class:`Circuit` based on a Quipper ASCII description of a circuit."""
        f = open(fname, 'r')
        lines = f.read().splitlines()
        f.close()
        start = lines[0]
        end = lines[-1]
        gates = lines[1:-1]
        if not start.startswith("Inputs: "):
            raise TypeError("File does not start correctly: " + start)
        if start.endswith(','): start = start[:-1]
        inputs = start[8:].split(",")
        
        for i in inputs:
            n, t = i.split(":")
            if t.strip() != "Qbit":
                raise TypeError("Unsupported type " + t)

        c = Circuit(len(inputs))
        for gate in gates:
        	if gate.startswith("Comment"): continue
            if not gate.startswith("QGate"):
                raise TypeError("Unsupported expression: " + gate)
            l = gate.split("with")
            g = l[0]
            gname = g[g.find('[')+2:g.find(']')-1]
            target = int(g[g.find('(')+1:g.find(')')])
            adjoint = g.find("*")!=-1
            if len(l) == 2: #no controls
                if gname == "H": c.add_gate("HAD", target)
                elif gname == "not": c.add_gate("NOT", target)
                elif gname == "Z": c.add_gate("Z", target)
                elif gname == "S": c.add_gate("S", target, adjoint=adjoint)
                elif gname == "T": c.add_gate("T", target, adjoint=adjoint)
                else:
                    raise TypeError("Unsupported gate: " + gname)
                continue
            elif len(l) != 3: raise TypeError("Unsupported expression: " + gate)
            ctrls = l[1]
            ctrls = ctrls[ctrls.find('[')+1:ctrls.find(']')]
            if ctrls.find(',')!=-1:
                raise TypeError("Multiple controls are not supported: " + gate)
            if ctrls.find('+')==-1:
                raise TypeError("Unsupported target: " + ctrls)
            ctrl = int(ctrls[1:])
            if gname == "not": c.add_gate("CNOT", target, ctrl)
        	elif gname == "Z": c.add_gate("CZ", target, ctrl)
        	elif gname == "X": c.add_gate("CX", target, ctrl)
            else:
                raise TypeError("Unsupported controlled gate: " + gname)
            

        return c


    def add_gate(self, gate, *args, **kwargs):
    	"""Adds a gate to the circuit. ``gate`` can either be 
    	an instance of a :class:`Gate`, or it can be the name of a gate,
    	in which case additional arguments should be given.

    	Example::
			
			circuit.add_gate("CNOT", 1, 4) # adds a CNOT gate with target 1 and control 4
			circuit.add_gate("ZPhase", 2, phase=Fraction(3,4)) # Adds a ZPhase gate on qubit 2 with phase 3/4
    	"""
        if isinstance(gate, str):
            gate_class = gate_types[gate]
            gate = gate_class(*args, **kwargs)
        self.gates.append(gate)

    def to_graph(self, backend=None):
    	"""Turns the circuit into a ZX-Graph."""
        g = Graph(backend)
        qs = []
        r = 0
        for i in range(self.q):
            v = g.add_vertex(0,i,r)
            qs.append(v)

        r += 1

        for gate in self.gates:
            gate.to_graph(g,qs,r)
            r += 1

        for o in range(self.q):
            v = g.add_vertex(0,o,r)
            g.add_edge((qs[o],v))

        return g

    def to_quipper(self):
    	"""Produces a Quipper ASCII description of the circuit."""
        s = "Inputs: " + ", ".join("{!s}Qbit".format(i) for i in range(self.q)) + "\n"
        for g in self.gates:
            s += g.to_quipper() + "\n"
        s += "Outputs: " + ", ".join("{!s}Qbit".format(i) for i in range(self.q))
        return s


class Gate(object):
	"""Base class for representing quantum gates."""
    def graph_add_node(self, g, qs, t, q, r, phase=0):
        v = g.add_vertex(t,q,r,phase)
        g.add_edge((qs[q],v))
        qs[q] = v
        return v

    def __str__(self):
        attribs = []
        if hasattr(self, "target"): attribs.append(str(self.target))
        if hasattr(self, "control"): attribs.append(str(self.control))
        if hasattr(self, "phase") and self.printphase: attribs.append("phase={!s}".format(self.phase))
        return "{}{}({})".format(self.name,("*" if (hasattr(self,"adjoint") and self.adjoint) else ""), ",".join(attribs))

    def __repr__(self):
        return str(self)

    def to_quipper(self):
        n = self.name if not hasattr(self, "quippername") else self.quippername
        s = 'QGate["{}"]{}({!s})'.format(n,("*" if (hasattr(self,"adjoint") and self.adjoint) else ""),self.target)
        if hasattr(self, "control"):
            s += ' with controls=[+{!s}]'.format(self.control)
        s += ' with nocontrol'
        return s

class ZPhase(Gate):
    name = 'ZPhase'
    printphase = True
    def __init__(self, target, phase):
        self.target = target
        self.phase = phase
        self.name 

    def to_graph(self, g, qs, r):
        self.graph_add_node(g,qs,1,self.target,r,self.phase)


class Z(ZPhase):
    name = 'Z'
    printphase = False
    def __init__(self, target):
        super().__init__(target, Fraction(1,1))

class S(ZPhase):
    name = 'S'
    printphase = False
    def __init__(self, target, adjoint=False):
        super().__init__(target, Fraction(1,2)*(-1 if adjoint else 1))
        self.adjoint = adjoint

class T(ZPhase):
    name = 'T'
    printphase = False
    def __init__(self, target, adjoint=False):
        super().__init__(target, Fraction(1,4)*(-1 if adjoint else 1))
        self.adjoint = adjoint

class XPhase(Gate):
    name = 'XPhase'
    printphase = True
    def __init__(self, target, phase=0):
        self.target = target
        self.phase = phase

    def to_graph(self, g, qs, r):
        self.graph_add_node(g,qs,2,self.target,r,self.phase)

class NOT(XPhase):
    name = 'NOT'
    quippername = 'not'
    printphase = False
    def __init__(self, target):
        super().__init__(target, phase = Fraction(1,1))


class CNOT(Gate):
    name = 'CNOT'
    quippername = 'not'
    def __init__(self, target, control):
        self.target = target
        self.control = control

    def to_graph(self, g, qs, r):
        t = self.graph_add_node(g,qs,2,self.target,r)
        c = self.graph_add_node(g,qs,1,self.control,r)
        g.add_edge((t,c))

class CZ(Gate):
    name = 'CZ'
    quippername = 'Z'
    def __init__(self, target, control):
        self.target = target
        self.control = control

    def to_graph(self, g, qs, r):
        t = self.graph_add_node(g,qs,1,self.target,r)
        c = self.graph_add_node(g,qs,1,self.control,r)
        g.add_edge((t,c),2)

class CX(Gate):
    name = 'CX'
    quippername = 'X'
    def __init__(self, target, control):
        self.target = target
        self.control = control

    def to_graph(self, g, qs, r):
        t = self.graph_add_node(g,qs,2,self.target,r)
        c = self.graph_add_node(g,qs,2,self.control,r)
        g.add_edge((t,c),2)

class HAD(Gate):
    name = 'HAD'
    quippername = 'H'
    def __init__(self, target):
        self.target = target

    def to_graph(self,g, qs, r):
        v = g.add_vertex(1,self.target,r)
        g.add_edge((qs[self.target],v),2)
        qs[self.target] = v



gate_types = {
    "XPhase": XPhase,
    "NOT": NOT,
    "ZPhase": ZPhase,
    "Z": Z,
    "S": S,
    "T": T,
    "CNOT": CNOT,
    "CZ": CZ,
    "CX": CX,
    "HAD": HAD,
}