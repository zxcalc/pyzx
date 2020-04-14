import sys
from pathlib import Path
import pyzx as zx
import os
import time
import multiprocessing as mp


class CircuitComparer:
    def __init__(self, dirname, before, after):
        self.fname_before = os.path.join(dirname, before)
        if after:
            self.fname_after = os.path.join(dirname, after)
        else:
            self.fname_after = ""
        self.fname_tpar = ""
        if before.find('before') != -1:
            self.name = before[:-7]
        else:
            self.name = before
        self.has_run = False
    
    def __str__(self):
        return "CircuitComparer({}, {})".format(self.name, str(self.has_run))

    def __repr__(self):
        return str(self)
    
    def run(self):
        if self.has_run: return True
        #try: 
        if self.fname_after:
            c = zx.Circuit.from_quipper_file(self.fname_after).to_basic_gates()
            self.t_opt = c.tcount()
        else:
            self.t_opt = '-'
        c = zx.Circuit.load(self.fname_before).to_basic_gates()
        self.qubits = c.qubits
        #except TypeError: return False
        if self.fname_tpar:
            c2 = zx.Circuit.load(self.fname_tpar)
            self.tpar = c2.tcount()
        else: self.tpar = "-"
        self.gatecount = len(c.gates)
        self.t_before = c.tcount()
        g = c.to_graph()
        t = time.time()
        while True:
            zx.simplify.full_reduce(g)
            break
            m = zx.rules.match_gadgets_phasepoly(g)
            if not m: break
            zx.rules.apply_gadget_phasepoly(g, m)
        self.t_after = zx.tcount(g)
        self.time_simpl = time.time() - t
        t = time.time()
        self.extracts = True
        try:
            c2 = zx.extract.streaming_extract(g,quiet=True)
            self.time_extr = time.time() - t
        except Exception:
            self.extracts = False
            self.time_extr = None
        self.has_run = True
        del c, g
        return True

    def pretty(self):
        if not self.has_run:
            success = self.run()
        else: success = True
        if not success: 
            return self.name + "    -"
        s = self.name.ljust(20) + str(self.qubits).rjust(7)
        s += str(self.gatecount).rjust(8) + str(self.t_before).rjust(9) + str(self.t_opt).rjust(10) 
        s += str(self.tpar).rjust(6) + str(self.t_after).rjust(7)
        s += "{:.2f}".format(self.time_simpl).rjust(12)
        time_extr = "{:.2f}".format(self.time_extr) if self.time_extr is not None else "-"
        s += time_extr.rjust(14)
        #s += ("y" if self.extracts else "n").rjust(7)
        return s

def runner(arg):
    c, printlock = arg
    s = c.pretty()
    with printlock:
        print(s)
    sys.stdout.flush()
    return s

if __name__ == '__main__':
    circ_dir = Path('circuits')
    dirs = [circ_dir / 'Arithmetic_and_Toffoli',
            circ_dir / 'QFT_and_Adders',
            circ_dir / 'Other']
    beforefiles = []
    afterfiles = []
    tparfiles = []
    for d in dirs:
        for f in os.listdir(d):
            if not os.path.isfile(os.path.join(d,f)): continue
            if f.find('before') != -1:
                beforefiles.append((f,d))
            elif f.find('tpar') != -1:
                tparfiles.append((f,d))
            elif f.find('.qc') != -1 or f.find('.tfc') != -1:
                beforefiles.append((f,d))
            else: afterfiles.append((f,d))

    circuits = []
    for f, d in beforefiles:
        n = f[:-7]
        for f2,d2 in afterfiles:
            if d!=d2: continue
            if f2.startswith(n):
                c = CircuitComparer(d, f, f2)
                circuits.append(c)
                break
        else:
            c = CircuitComparer(d, f, '')
            circuits.append(c)
        for f2,d2 in tparfiles:
            if d!=d2: continue
            if f2.startswith(n):
                circuits[-1].fname_tpar = os.path.join(d2,f2)

    nprocesses = 4
    m = mp.Manager()
    printlock = m.Lock()
    pool = mp.Pool(processes=nprocesses)
    print("Circuit".ljust(20), "qubits", "G-count", "T-before", "T-kitchen", "T-par", "  T-us", "  Time-Simp", "Time-Extract")
    try:
        strings = pool.map(runner, [(c,printlock) for c in circuits])
    finally:
        pool.terminate()
    strings.sort()
    print("\n\n")
    print("Circuit".ljust(20), "qubits", "G-count", "T-before", "T-kitchen", "T-par", "  T-us", "  Time-Simp", "Time-Extract")
    print("\n".join(strings))
