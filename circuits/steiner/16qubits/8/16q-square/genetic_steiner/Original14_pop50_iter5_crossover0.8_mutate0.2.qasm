// Initial wiring: [13, 6, 8, 3, 5, 12, 9, 11, 7, 10, 15, 4, 1, 0, 2, 14]
// Resulting wiring: [13, 6, 8, 3, 5, 12, 9, 11, 7, 10, 15, 4, 1, 0, 2, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[6];
cx q[14], q[9];
cx q[7], q[8];
cx q[8], q[9];
cx q[6], q[7];
cx q[1], q[6];
cx q[1], q[2];
cx q[6], q[7];
cx q[2], q[5];
cx q[7], q[6];
