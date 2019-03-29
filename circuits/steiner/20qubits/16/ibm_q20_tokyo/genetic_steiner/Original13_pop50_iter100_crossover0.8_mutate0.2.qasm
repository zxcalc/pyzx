// Initial wiring: [5, 9, 19, 11, 7, 8, 0, 16, 6, 13, 10, 17, 2, 14, 3, 15, 1, 12, 18, 4]
// Resulting wiring: [5, 9, 19, 11, 7, 8, 0, 16, 6, 13, 10, 17, 2, 14, 3, 15, 1, 12, 18, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[7], q[2];
cx q[9], q[8];
cx q[8], q[7];
cx q[8], q[2];
cx q[9], q[8];
cx q[10], q[8];
cx q[13], q[6];
cx q[17], q[11];
cx q[19], q[18];
cx q[17], q[18];
cx q[13], q[16];
cx q[7], q[12];
cx q[12], q[11];
cx q[6], q[7];
cx q[7], q[6];
cx q[3], q[5];
cx q[2], q[7];
cx q[7], q[12];
cx q[1], q[7];
cx q[7], q[6];
cx q[6], q[12];
cx q[6], q[7];
