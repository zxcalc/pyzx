// Initial wiring: [16, 3, 10, 6, 7, 14, 2, 1, 13, 17, 18, 12, 8, 9, 15, 4, 19, 11, 5, 0]
// Resulting wiring: [16, 3, 10, 6, 7, 14, 2, 1, 13, 17, 18, 12, 8, 9, 15, 4, 19, 11, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[4];
cx q[13], q[11];
cx q[16], q[13];
cx q[11], q[0];
cx q[18], q[3];
cx q[8], q[11];
cx q[9], q[16];
cx q[3], q[6];
cx q[2], q[3];
cx q[4], q[19];
cx q[3], q[15];
cx q[1], q[12];
cx q[1], q[11];
cx q[5], q[10];
cx q[4], q[8];
