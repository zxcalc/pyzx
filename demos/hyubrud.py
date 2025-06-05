import pennylane as qml
from pennylane import numpy as np
import matplotlib.pyplot as plt

# Setup device
n_qubits = 3
dev = qml.device("default.qubit", wires=n_qubits)

# Hybrid circuit with simulated classical branching
def hybrid_block(theta, phi, meas_result):
    # Apply entangling operations
    qml.Hadamard(wires=0)
    qml.CNOT(wires=[0, 1])
    qml.CNOT(wires=[1, 2])

    # Mid-circuit simulated classical branch
    if meas_result == 0:
        qml.RY(theta, wires=1)
    else:
        qml.RZ(phi, wires=2)

@qml.qnode(dev)
def mixed_circuit(theta, phi, meas_result):
    hybrid_block(theta, phi, meas_result)
    return qml.probs(wires=range(n_qubits))

# Sweep over parameters
theta = np.pi / 4
phi = np.pi / 3
results = []

# Simulate 0 and 1 as mid-circuit measurement outcomes
for meas_result in [0, 1]:
    probs = mixed_circuit(theta, phi, meas_result)
    results.append(probs)

# Plotting
labels = [f"{i:03b}" for i in range(8)]
x = np.arange(len(labels))
width = 0.35

plt.bar(x - width/2, results[0], width, label="meas_result = 0")
plt.bar(x + width/2, results[1], width, label="meas_result = 1")
plt.xticks(x, labels)
plt.xlabel("Quantum State |q2 q1 q0⟩")
plt.ylabel("Probability")
plt.title("Hybrid Quantum-Classical Circuit Simulation")
plt.legend()
plt.tight_layout()
plt.show()
