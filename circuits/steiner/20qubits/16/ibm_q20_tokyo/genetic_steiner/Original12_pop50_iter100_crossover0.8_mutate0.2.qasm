// Initial wiring: [18, 5, 8, 1, 3, 0, 14, 19, 4, 16, 9, 10, 13, 15, 11, 12, 7, 17, 2, 6]
// Resulting wiring: [18, 5, 8, 1, 3, 0, 14, 19, 4, 16, 9, 10, 13, 15, 11, 12, 7, 17, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[8], q[1];
cx q[12], q[7];
cx q[13], q[6];
cx q[6], q[4];
cx q[13], q[6];
cx q[15], q[14];
cx q[17], q[16];
cx q[18], q[17];
cx q[18], q[11];
cx q[11], q[12];
cx q[8], q[11];
cx q[8], q[10];
cx q[6], q[13];
cx q[13], q[16];
cx q[3], q[6];
cx q[3], q[4];
cx q[1], q[2];
