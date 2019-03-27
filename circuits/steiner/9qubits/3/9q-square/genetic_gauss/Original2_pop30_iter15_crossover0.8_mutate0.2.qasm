// Initial wiring: [2, 7, 1, 0, 8, 6, 4, 5, 3]
// Resulting wiring: [2, 7, 1, 0, 8, 6, 4, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[7];
cx q[2], q[5];
cx q[0], q[8];
