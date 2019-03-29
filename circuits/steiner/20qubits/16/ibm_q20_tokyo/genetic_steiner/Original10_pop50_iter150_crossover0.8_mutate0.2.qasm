// Initial wiring: [9, 10, 14, 2, 5, 17, 7, 12, 6, 19, 11, 0, 16, 13, 4, 1, 8, 18, 15, 3]
// Resulting wiring: [9, 10, 14, 2, 5, 17, 7, 12, 6, 19, 11, 0, 16, 13, 4, 1, 8, 18, 15, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[11], q[8];
cx q[8], q[2];
cx q[13], q[6];
cx q[6], q[5];
cx q[6], q[3];
cx q[13], q[7];
cx q[13], q[6];
cx q[16], q[13];
cx q[13], q[7];
cx q[16], q[13];
cx q[17], q[12];
cx q[12], q[7];
cx q[7], q[2];
cx q[17], q[12];
cx q[14], q[16];
cx q[11], q[18];
cx q[9], q[10];
cx q[3], q[5];
cx q[2], q[3];
cx q[0], q[9];
