// Initial wiring: [3, 0, 6, 8, 4, 2, 1, 5, 7]
// Resulting wiring: [3, 0, 6, 8, 4, 2, 1, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[4], q[5];
cx q[0], q[5];
