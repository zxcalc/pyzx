// Initial wiring: [10, 15, 4, 2, 5, 14, 0, 12, 11, 1, 13, 3, 9, 8, 6, 7]
// Resulting wiring: [10, 15, 4, 2, 5, 14, 0, 12, 11, 1, 13, 3, 9, 8, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[6];
cx q[15], q[8];
cx q[8], q[7];
cx q[15], q[14];
cx q[7], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
