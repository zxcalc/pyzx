// Initial wiring: [6, 4, 1, 5, 8, 3, 7, 2, 0]
// Resulting wiring: [6, 4, 1, 5, 8, 3, 7, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[1];
cx q[8], q[5];
cx q[1], q[5];
cx q[0], q[1];
cx q[5], q[6];
