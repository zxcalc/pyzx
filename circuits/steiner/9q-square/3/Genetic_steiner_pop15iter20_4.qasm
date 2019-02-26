// Initial wiring: [6, 1, 2, 0, 3, 5, 8, 4, 7]
// Resulting wiring: [6, 1, 2, 0, 3, 5, 8, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[7], q[8];
cx q[7], q[6];
