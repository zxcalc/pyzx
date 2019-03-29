// Initial wiring: [18, 6, 5, 8, 16, 12, 17, 9, 4, 19, 13, 10, 2, 7, 11, 1, 15, 14, 3, 0]
// Resulting wiring: [18, 6, 5, 8, 16, 12, 17, 9, 4, 19, 13, 10, 2, 7, 11, 1, 15, 14, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[8], q[2];
cx q[10], q[9];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[6];
cx q[17], q[16];
cx q[16], q[13];
cx q[17], q[16];
cx q[19], q[18];
cx q[17], q[18];
cx q[16], q[17];
cx q[17], q[18];
cx q[15], q[16];
cx q[16], q[17];
cx q[17], q[18];
cx q[17], q[16];
cx q[12], q[13];
cx q[8], q[11];
cx q[6], q[13];
cx q[5], q[14];
cx q[2], q[3];
