// Initial wiring: [4, 7, 16, 14, 18, 5, 10, 6, 8, 1, 12, 11, 3, 17, 19, 2, 0, 15, 9, 13]
// Resulting wiring: [4, 7, 16, 14, 18, 5, 10, 6, 8, 1, 12, 11, 3, 17, 19, 2, 0, 15, 9, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[7], q[2];
cx q[10], q[9];
cx q[12], q[11];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[13], q[6];
cx q[13], q[12];
cx q[16], q[14];
cx q[14], q[5];
cx q[16], q[14];
cx q[17], q[16];
cx q[16], q[14];
cx q[17], q[12];
cx q[14], q[5];
cx q[12], q[7];
cx q[19], q[18];
cx q[6], q[7];
cx q[4], q[5];
cx q[1], q[7];
