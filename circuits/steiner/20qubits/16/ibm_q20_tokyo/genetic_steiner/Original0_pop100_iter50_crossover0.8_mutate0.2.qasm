// Initial wiring: [11, 14, 9, 15, 1, 2, 3, 17, 12, 6, 7, 0, 18, 8, 4, 10, 13, 5, 16, 19]
// Resulting wiring: [11, 14, 9, 15, 1, 2, 3, 17, 12, 6, 7, 0, 18, 8, 4, 10, 13, 5, 16, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[3], q[2];
cx q[7], q[2];
cx q[7], q[1];
cx q[9], q[0];
cx q[13], q[6];
cx q[6], q[5];
cx q[16], q[15];
cx q[16], q[13];
cx q[18], q[11];
cx q[11], q[8];
cx q[8], q[1];
cx q[11], q[8];
cx q[13], q[15];
cx q[11], q[12];
cx q[4], q[5];
