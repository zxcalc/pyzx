// Initial wiring: [18, 12, 11, 16, 19, 13, 10, 2, 17, 7, 1, 15, 4, 5, 6, 8, 9, 0, 3, 14]
// Resulting wiring: [18, 12, 11, 16, 19, 13, 10, 2, 17, 7, 1, 15, 4, 5, 6, 8, 9, 0, 3, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[7], q[6];
cx q[6], q[5];
cx q[12], q[6];
cx q[18], q[11];
cx q[19], q[18];
cx q[18], q[11];
cx q[11], q[9];
cx q[17], q[18];
cx q[13], q[16];
cx q[12], q[13];
cx q[13], q[16];
cx q[13], q[15];
cx q[11], q[18];
cx q[10], q[19];
cx q[19], q[18];
cx q[8], q[9];
cx q[7], q[8];
cx q[1], q[2];
