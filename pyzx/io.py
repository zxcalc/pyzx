from fractions import Fraction

from .graph.graph import Graph
from .simplify import id_simp

def read_quipper_file(fname, backend=None, keynames=('q','r')):
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
		if not gate.startswith("QGate"):
			raise TypeError("Unsupported expression: " + gate)
		l = gate.split("with")
		g = l[0]
		gname = g[g.find('[')+2:g.find(']')-1]
		target = int(g[g.find('(')+1:g.find(')')])
		conj = 1 if g.find("*")==-1 else -1
		if len(l) == 2: #no controls
			if gname == "H": es2.append((q[target],v))
			else: es1.append((q[target],v))
			q[target] = v
			qs.append(target)
			rs.append(r)
			if gname == "not":
				ty.append(2)
				phases[v] = Fraction(1,1)
			elif gname == "Z":
				ty.append(1)
				phases[v] = Fraction(1,1)
			elif gname == "H":
				ty.append(1)
			elif gname == "S":
				ty.append(1)
				phases[v] = Fraction(conj,2)
			elif gname == "T":
				ty.append(1)
				phases[v] = Fraction(conj,4)
			else:
				raise TypeError("Unsupported gate: " + gname)
			v += 1
			r += 1
			continue
		elif len(l) != 3: raise TypeError("Unsupported expression: " + gate)
		ctrls = l[1]
		ctrls = ctrls[ctrls.find('[')+1:ctrls.find(']')]
		if ctrls.find(',')!=-1:
			raise TypeError("Multiple controls are not supported: " + gate)
		if ctrls.find('+')==-1:
			raise TypeError("Unsupported target: " + ctrls)
		ctrl = int(ctrls[1:])
		if gname != "not":
			raise TypeError("Unsupported controlled gate: " + gname)
		es1 += [(q[target],v), (q[ctrl],v+1), (v,v+1)]
		qs += [target,ctrl]
		ty += [2,1]
		rs += [r,r]
		q[target] = v
		q[ctrl] = v+1
		v += 2
		r += 1

	# outputs
	qs += list(range(qubits))
	rs += [r] * qubits
	ty += [0] * qubits
	es1 += [(q[i], v+i) for i in range(qubits)]
	v += qubits

	g = Graph(backend)

	g.add_vertices(v)
	g.add_edges(es1,1)
	g.add_edges(es2,2)

	for i in range(v):
		g.set_type(i, ty[i])
		g.set_vdata(i, keynames[0], qs[i])
		g.set_vdata(i, keynames[1], rs[i])
	for v, phase in phases.items():
		g.set_angle(v,phase)

	for i in range(qubits):
		g.set_vdata(i, 'i', True)
		g.set_vdata(v-i-1, 'o', True)

	#remove the identity nodes introduced for the hadamard gates
	id_simp(g)

	return g