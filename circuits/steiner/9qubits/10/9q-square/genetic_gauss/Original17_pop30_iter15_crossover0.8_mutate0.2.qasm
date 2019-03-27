// Initial wiring: [4, 8, 6, 2, 1, 5, 7, 0, 3]
// Resulting wiring: [4, 8, 6, 2, 1, 5, 7, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[0];
cx q[4], q[3];
cx q[6], q[5];
cx q[8], q[5];
cx q[7], q[0];
cx q[2], q[5];
cx q[1], q[5];
