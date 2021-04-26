from .extract import extract_circuit
from .simplify import full_reduce
from .optimize import basic_optimization

# Weighted gate count
def wgc(c, two_qb_weight=10):
    c_tmp = c.to_basic_gates()
    total = len(c_tmp.gates)
    n2 = c_tmp.twoqubitcount()
    single_qubit_count = total - n2
    return two_qb_weight * n2 + single_qubit_count

# Weighted gate count of a ZX-diagram
def g_wgc(g, two_qb_weight=10, g_simplify=True, c_simplify=True):
    g_tmp = g.copy()
    if g_simplify:
        full_reduce(g_tmp)

    c = extract_circuit(g_tmp.copy()).to_basic_gates()

    if c_simplify:
        c = basic_optimization(c)

    return wgc(c, two_qb_weight=two_qb_weight)
