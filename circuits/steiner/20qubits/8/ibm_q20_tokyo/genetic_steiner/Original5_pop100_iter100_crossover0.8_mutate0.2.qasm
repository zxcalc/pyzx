// Initial wiring: [4, 10, 6, 1, 0, 16, 14, 8, 3, 19, 15, 5, 18, 12, 11, 2, 9, 7, 17, 13]
// Resulting wiring: [4, 10, 6, 1, 0, 16, 14, 8, 3, 19, 15, 5, 18, 12, 11, 2, 9, 7, 17, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[3], q[2];
cx q[7], q[6];
cx q[13], q[12];
cx q[14], q[5];
cx q[17], q[16];
cx q[9], q[10];
cx q[7], q[8];
