// Initial wiring: [4, 9, 18, 3, 7, 1, 6, 5, 14, 10, 12, 2, 11, 0, 15, 16, 13, 17, 19, 8]
// Resulting wiring: [4, 9, 18, 3, 7, 1, 6, 5, 14, 10, 12, 2, 11, 0, 15, 16, 13, 17, 19, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[12], q[7];
cx q[15], q[16];
cx q[14], q[15];
cx q[13], q[16];
cx q[16], q[17];
cx q[13], q[15];
cx q[4], q[6];
cx q[1], q[7];
