// Initial wiring: [12, 5, 13, 3, 4, 18, 17, 10, 1, 2, 0, 15, 8, 6, 9, 19, 11, 7, 16, 14]
// Resulting wiring: [12, 5, 13, 3, 4, 18, 17, 10, 1, 2, 0, 15, 8, 6, 9, 19, 11, 7, 16, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[5], q[4];
cx q[7], q[6];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[8];
cx q[13], q[6];
cx q[12], q[11];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[5];
cx q[14], q[13];
cx q[15], q[13];
cx q[13], q[6];
cx q[18], q[17];
cx q[18], q[11];
cx q[19], q[10];
cx q[16], q[17];
cx q[8], q[9];
cx q[7], q[13];
