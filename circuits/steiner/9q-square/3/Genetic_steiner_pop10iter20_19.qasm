// Initial wiring: [3, 6, 5, 0, 4, 2, 1, 8, 7]
// Resulting wiring: [3, 6, 5, 0, 4, 2, 1, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[3], q[8];
cx q[3], q[2];
