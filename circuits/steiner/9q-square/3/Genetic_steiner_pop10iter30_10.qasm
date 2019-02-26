// Initial wiring: [6, 2, 3, 4, 0, 5, 1, 8, 7]
// Resulting wiring: [6, 2, 3, 4, 0, 5, 1, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[6], q[7];
cx q[5], q[6];
cx q[0], q[5];
