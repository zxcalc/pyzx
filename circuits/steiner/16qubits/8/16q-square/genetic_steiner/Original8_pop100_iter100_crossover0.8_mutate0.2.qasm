// Initial wiring: [4, 2, 1, 15, 7, 10, 6, 13, 11, 3, 9, 12, 0, 5, 8, 14]
// Resulting wiring: [4, 2, 1, 15, 7, 10, 6, 13, 11, 3, 9, 12, 0, 5, 8, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[14];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[9];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[11];
cx q[4], q[3];
cx q[1], q[6];
