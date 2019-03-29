// Initial wiring: [18, 9, 17, 3, 5, 7, 12, 16, 1, 6, 0, 8, 2, 13, 19, 14, 15, 10, 11, 4]
// Resulting wiring: [18, 9, 17, 3, 5, 7, 12, 16, 1, 6, 0, 8, 2, 13, 19, 14, 15, 10, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[8], q[7];
cx q[8], q[2];
cx q[10], q[9];
cx q[13], q[7];
cx q[12], q[13];
cx q[13], q[16];
cx q[10], q[19];
cx q[9], q[11];
cx q[7], q[12];
cx q[12], q[18];
cx q[12], q[17];
cx q[6], q[13];
cx q[3], q[6];
cx q[1], q[7];
cx q[7], q[12];
cx q[12], q[7];
