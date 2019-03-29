// Initial wiring: [16, 10, 14, 15, 9, 4, 5, 19, 3, 12, 17, 11, 13, 0, 18, 8, 6, 2, 7, 1]
// Resulting wiring: [16, 10, 14, 15, 9, 4, 5, 19, 3, 12, 17, 11, 13, 0, 18, 8, 6, 2, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[7], q[6];
cx q[11], q[8];
cx q[8], q[1];
cx q[11], q[8];
cx q[14], q[5];
cx q[16], q[14];
cx q[16], q[13];
cx q[17], q[16];
cx q[19], q[10];
cx q[10], q[9];
cx q[19], q[10];
cx q[11], q[12];
cx q[8], q[11];
cx q[11], q[17];
cx q[17], q[16];
cx q[11], q[8];
cx q[16], q[17];
cx q[6], q[13];
cx q[13], q[15];
cx q[3], q[5];
