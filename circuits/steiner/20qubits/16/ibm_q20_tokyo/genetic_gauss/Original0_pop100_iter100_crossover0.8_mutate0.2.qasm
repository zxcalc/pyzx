// Initial wiring: [4, 13, 3, 16, 11, 0, 5, 7, 8, 17, 19, 14, 2, 1, 12, 10, 18, 6, 15, 9]
// Resulting wiring: [4, 13, 3, 16, 11, 0, 5, 7, 8, 17, 19, 14, 2, 1, 12, 10, 18, 6, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[11], q[4];
cx q[13], q[12];
cx q[17], q[4];
cx q[14], q[11];
cx q[18], q[19];
cx q[9], q[11];
cx q[9], q[19];
cx q[8], q[15];
cx q[3], q[5];
cx q[5], q[16];
cx q[2], q[12];
cx q[5], q[11];
cx q[1], q[8];
