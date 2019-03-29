// Initial wiring: [3, 15, 0, 17, 7, 13, 2, 14, 6, 11, 19, 9, 18, 12, 1, 16, 10, 8, 4, 5]
// Resulting wiring: [3, 15, 0, 17, 7, 13, 2, 14, 6, 11, 19, 9, 18, 12, 1, 16, 10, 8, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[6], q[3];
cx q[8], q[7];
cx q[10], q[9];
cx q[11], q[10];
cx q[12], q[7];
cx q[15], q[13];
cx q[16], q[13];
cx q[17], q[16];
cx q[16], q[13];
cx q[13], q[7];
cx q[18], q[17];
cx q[15], q[16];
cx q[13], q[16];
cx q[12], q[13];
cx q[5], q[6];
cx q[4], q[6];
cx q[2], q[7];
cx q[2], q[8];
cx q[7], q[6];
