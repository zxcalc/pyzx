// Initial wiring: [18, 15, 2, 10, 14, 1, 16, 7, 0, 11, 6, 5, 13, 4, 9, 17, 19, 3, 12, 8]
// Resulting wiring: [18, 15, 2, 10, 14, 1, 16, 7, 0, 11, 6, 5, 13, 4, 9, 17, 19, 3, 12, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[3], q[2];
cx q[8], q[7];
cx q[7], q[6];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[9], q[0];
cx q[12], q[6];
cx q[6], q[4];
cx q[12], q[6];
cx q[13], q[6];
cx q[6], q[4];
cx q[14], q[13];
cx q[15], q[13];
cx q[16], q[15];
cx q[19], q[10];
cx q[13], q[16];
cx q[12], q[17];
cx q[9], q[11];
cx q[8], q[11];
