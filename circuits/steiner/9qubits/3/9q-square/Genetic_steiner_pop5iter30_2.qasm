// Initial wiring: [2, 4, 7, 6, 1, 3, 0, 8, 5]
// Resulting wiring: [2, 4, 7, 6, 1, 3, 0, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[3], q[8];
cx q[4], q[3];
