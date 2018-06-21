from fractions import Fraction

from .graph.graph import Graph

def read_quipper_file(fname, backend=None, keynames=('q','r')):
	f = open(fname, 'r')
	lines = f.read().splitlines()
	f.close()
	start = lines[0]
	end = lines[-1]
	gates = lines[1:-1]
	if not start.startswith("Inputs: "):
		raise TypeError("File does not start correctly: " + start)
	inputs = start[8:].split(", ")
	
	for i in inputs:
		n, t = i.split(":")
		if t != "Qbit":
			raise TypeError("Unsupported type " + t)
	
	qubits = len(inputs)
	g = Graph(backend)
	q = list(range(qubits))
	r = 1                     # current rank
    ty = [0] * qubits         # types of vertices
    qs = list(range(qubits))  # tracks qubit indices of vertices
    rs = [0] * qubits         # tracks rank of vertices
    v = qubits                # next vertex to add
    es1 = [] # normal edges to add
    es2 = [] # hadamard edges to add
    phases = {}

   	for gate in gates:
   		if not gate.startswith("Qgate"):
   			raise TypeError("Unsupported expression: " + gate)
   		l = gate.split("with")
   		g = gate[0]
   		gname = g[g.find('[')+2:g.find(']')-1]
   		gtarget = int(g[g.find('(')+1:g.find(')')])
   		if len(l) == 2: #no controls
   			if gname == "H": es2.append((q[gtarget],v))
   			else: es1.append((q[gtarget],v))
   			q[gtarget] = v
   			qs.append(gtarget)
   			rs.append(r)
   			if gname == "not":
   				ty.append(2)
   				phases[v] = Fraction(1,1)
   			elif gname == "H":
   				ty.append(1)
   			elif gname == "S":
   				ty.append(1)
   				phases[v] = Fraction(1,2)
   			elif gname == "T":
   				ty.append(1)
   				phases[v] = Fraction(1,4)


