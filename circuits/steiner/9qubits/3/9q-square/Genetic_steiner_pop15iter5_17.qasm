// Initial wiring: [3, 8, 1, 5, 4, 2, 0, 6, 7]
// Resulting wiring: [3, 8, 1, 5, 4, 2, 0, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[0], q[5];
cx q[3], q[8];
