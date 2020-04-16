from typing import List

from . import Circuit

def circuit_to_emoji(c: Circuit, compress_rows:bool=True) -> str:
    """Turns the circuit into a ZX-Graph.
    If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
    on the same row."""
    strings: List[List[str]] = [list() for _ in range(c.qubits)]
    #for i in range(c.qubits):
    #    strings[i].append(':Wire_lr:')

    for gate in c.gates:
        if not compress_rows:
            r = max([len(s) for s in strings])
            for s in strings: 
                s.extend([':W_:']*(r-len(s)))
        if not hasattr(gate, "to_emoji"): raise TypeError("Gate {} cannot be converted to emoji".format(str(gate)))
        gate.to_emoji(strings) # type: ignore
        if not compress_rows:
            r = max([len(s) for s in strings])
            for s in strings: 
                s.extend([':W_:']*(r-len(s)))

    r = max([len(s) for s in strings])
    for s in strings: 
        s.extend([':W_:']*(r-len(s)))

    return "\n".join(["".join(s) for s in strings])