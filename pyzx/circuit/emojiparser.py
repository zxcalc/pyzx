def circuit_to_emoji(c, compress_rows=True):
    """Turns the circuit into a ZX-Graph.
    If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
    on the same row."""
    strings = [list() for _ in range(c.qubits)]
    #for i in range(c.qubits):
    #    strings[i].append(':Wire_lr:')

    for gate in c.gates:
        if not compress_rows:
            r = max([len(s) for s in strings])
            for s in strings: 
                s.extend([':W_:']*(r-len(s)))
        gate.to_emoji(strings)
        if not compress_rows:
            r = max([len(s) for s in strings])
            for s in strings: 
                s.extend([':W_:']*(r-len(s)))

    r = max([len(s) for s in strings])
    for s in strings: 
        s.extend([':W_:']*(r-len(s)))

    return "\n".join(["".join(s) for s in strings])