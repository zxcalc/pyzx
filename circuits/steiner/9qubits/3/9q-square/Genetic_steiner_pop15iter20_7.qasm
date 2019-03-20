// Initial wiring: [0, 2, 8, 4, 3, 6, 1, 5, 7]
// Resulting wiring: [0, 2, 8, 4, 3, 6, 1, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[4], q[7];
cx q[7], q[8];
