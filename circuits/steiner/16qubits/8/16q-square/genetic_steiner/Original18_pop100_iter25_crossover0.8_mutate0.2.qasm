// Initial wiring: [11, 9, 14, 0, 1, 2, 12, 4, 15, 3, 6, 8, 5, 7, 13, 10]
// Resulting wiring: [11, 9, 14, 0, 1, 2, 12, 4, 15, 3, 6, 8, 5, 7, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[0];
cx q[8], q[7];
cx q[7], q[0];
cx q[14], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[15], q[14];
cx q[4], q[5];
cx q[3], q[4];
