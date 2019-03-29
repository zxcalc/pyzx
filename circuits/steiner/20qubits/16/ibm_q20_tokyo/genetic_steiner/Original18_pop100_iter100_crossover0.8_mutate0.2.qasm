// Initial wiring: [9, 19, 18, 7, 1, 13, 0, 16, 15, 6, 10, 12, 14, 2, 11, 17, 8, 4, 3, 5]
// Resulting wiring: [9, 19, 18, 7, 1, 13, 0, 16, 15, 6, 10, 12, 14, 2, 11, 17, 8, 4, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[8], q[1];
cx q[10], q[8];
cx q[10], q[9];
cx q[8], q[7];
cx q[11], q[8];
cx q[16], q[13];
cx q[13], q[7];
cx q[13], q[6];
cx q[17], q[16];
cx q[18], q[12];
cx q[12], q[6];
cx q[9], q[11];
cx q[4], q[6];
cx q[2], q[7];
cx q[0], q[1];
