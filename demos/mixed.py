"""
Benchmark: Classical vs Quantum Circuit

This script creates a simple logic function (e.g., parity or full adder) and implements it:
- Classically using Python logic gates
- Quantum mechanically using Qiskit

It compares execution time and output behavior.
"""

import timeit
from qiskit import QuantumCircuit, Aer, execute
from random import randint

# -----------------------------
# Classical Logic Function
# -----------------------------
def classical_parity(inputs):
    """Return the parity (XOR) of a list of bits"""
    result = 0
    for bit in inputs:
        result ^= bit
    return result

def run_classical_batch(n=1000, size=5):
    """Run multiple parity calculations"""
    results = []
    for _ in range(n):
        bits = [randint(0, 1) for _ in range(size)]
        results.append(classical_parity(bits))
    return results

# -----------------------------
# Quantum Circuit Function
# -----------------------------
def quantum_parity_circuit(bits):
    """Create a quantum circuit that computes parity"""
    n = len(bits)
    qc = QuantumCircuit(n + 1, 1)  # n inputs + 1 ancilla

    for i, bit in enumerate(bits):
        if bit == 1:
            qc.x(i)

    for i in range(n):
        qc.cx(i, n)

    qc.measure(n, 0)
    return qc

def run_quantum_batch(n=1000, size=5):
    """Run multiple quantum parity circuits"""
    simulator = Aer.get_backend("aer_simulator")
    results = []
    for _ in range(n):
        bits = [randint(0, 1) for _ in range(size)]
        qc = quantum_parity_circuit(bits)
        job = execute(qc, simulator, shots=1)
        result = job.result()
        measured = int(list(result.get_counts().keys())[0])
        results.append(measured)
    return results

# -----------------------------
# Benchmarking
# -----------------------------
if __name__ == "__main__":
    N_RUNS = 100

    print("Benchmarking classical parity...")
    time_classical = timeit.timeit(lambda: run_classical_batch(n=N_RUNS), number=1)
    print(f"Classical total time for {N_RUNS} runs: {time_classical:.4f} sec")

    print("Benchmarking quantum parity...")
    time_quantum = timeit.timeit(lambda: run_quantum_batch(n=N_RUNS), number=1)
    print(f"Quantum total time for {N_RUNS} runs: {time_quantum:.4f} sec")

    print("\nConclusion:")
    print("Classical is faster for simple logic like XOR, but quantum circuits scale differently.")
