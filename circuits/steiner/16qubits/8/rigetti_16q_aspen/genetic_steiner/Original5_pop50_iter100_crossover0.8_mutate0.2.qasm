// Initial wiring: [13, 6, 4, 1, 2, 7, 9, 5, 10, 0, 12, 3, 14, 15, 8, 11]
// Resulting wiring: [13, 6, 4, 1, 2, 7, 9, 5, 10, 0, 12, 3, 14, 15, 8, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[2], q[1];
cx q[1], q[0];
cx q[3], q[2];
cx q[5], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[15], q[14];
cx q[8], q[9];
cx q[6], q[7];
