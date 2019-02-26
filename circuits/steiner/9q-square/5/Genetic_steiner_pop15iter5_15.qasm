// Initial wiring: [1, 0, 2, 4, 8, 6, 5, 3, 7]
// Resulting wiring: [1, 0, 2, 4, 8, 6, 5, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[3], q[8];
cx q[4], q[1];
cx q[2], q[1];
cx q[5], q[0];
