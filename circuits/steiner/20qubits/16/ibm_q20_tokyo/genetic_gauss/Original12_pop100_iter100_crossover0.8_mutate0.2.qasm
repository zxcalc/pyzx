// Initial wiring: [4, 16, 5, 10, 0, 2, 17, 15, 1, 18, 13, 7, 9, 12, 19, 3, 14, 6, 8, 11]
// Resulting wiring: [4, 16, 5, 10, 0, 2, 17, 15, 1, 18, 13, 7, 9, 12, 19, 3, 14, 6, 8, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[16], q[7];
cx q[13], q[19];
cx q[8], q[15];
cx q[7], q[15];
cx q[7], q[11];
cx q[6], q[11];
cx q[8], q[16];
cx q[10], q[14];
cx q[3], q[10];
cx q[0], q[3];
cx q[0], q[2];
cx q[2], q[18];
cx q[4], q[15];
cx q[0], q[12];
cx q[5], q[6];
