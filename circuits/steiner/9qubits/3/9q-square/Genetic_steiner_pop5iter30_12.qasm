// Initial wiring: [4, 7, 2, 3, 6, 8, 1, 0, 5]
// Resulting wiring: [4, 7, 2, 3, 6, 8, 1, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[3], q[2];
cx q[4], q[3];
