// Initial wiring: [6, 11, 15, 14, 5, 4, 13, 8, 0, 9, 12, 1, 3, 10, 2, 7]
// Resulting wiring: [6, 11, 15, 14, 5, 4, 13, 8, 0, 9, 12, 1, 3, 10, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[0];
cx q[8], q[9];
cx q[9], q[10];
cx q[6], q[9];
cx q[6], q[7];
cx q[1], q[6];
cx q[6], q[7];
cx q[0], q[1];
cx q[1], q[6];
cx q[6], q[9];
