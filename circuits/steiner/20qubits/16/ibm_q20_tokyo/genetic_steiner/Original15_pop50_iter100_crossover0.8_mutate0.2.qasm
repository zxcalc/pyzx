// Initial wiring: [15, 2, 12, 16, 8, 3, 1, 4, 6, 5, 10, 9, 17, 7, 13, 11, 0, 19, 18, 14]
// Resulting wiring: [15, 2, 12, 16, 8, 3, 1, 4, 6, 5, 10, 9, 17, 7, 13, 11, 0, 19, 18, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[5], q[4];
cx q[9], q[8];
cx q[8], q[1];
cx q[10], q[8];
cx q[8], q[7];
cx q[8], q[2];
cx q[11], q[8];
cx q[8], q[2];
cx q[11], q[8];
cx q[14], q[5];
cx q[5], q[3];
cx q[3], q[2];
cx q[14], q[5];
cx q[17], q[11];
cx q[19], q[18];
cx q[12], q[13];
cx q[12], q[17];
cx q[13], q[16];
cx q[13], q[14];
cx q[2], q[3];
