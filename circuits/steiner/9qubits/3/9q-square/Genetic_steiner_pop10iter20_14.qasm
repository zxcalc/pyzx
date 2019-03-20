// Initial wiring: [6, 8, 7, 1, 2, 0, 3, 4, 5]
// Resulting wiring: [6, 8, 7, 1, 2, 0, 3, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[7], q[8];
cx q[7], q[6];
