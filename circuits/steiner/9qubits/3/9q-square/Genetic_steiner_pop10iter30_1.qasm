// Initial wiring: [2, 3, 0, 6, 7, 8, 1, 4, 5]
// Resulting wiring: [2, 3, 0, 6, 7, 8, 1, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[0], q[5];
cx q[6], q[5];
