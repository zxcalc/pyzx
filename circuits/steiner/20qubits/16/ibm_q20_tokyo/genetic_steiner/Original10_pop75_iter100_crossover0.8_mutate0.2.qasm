// Initial wiring: [11, 19, 9, 4, 8, 10, 12, 18, 16, 5, 3, 17, 14, 6, 0, 1, 15, 13, 2, 7]
// Resulting wiring: [11, 19, 9, 4, 8, 10, 12, 18, 16, 5, 3, 17, 14, 6, 0, 1, 15, 13, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[2], q[1];
cx q[6], q[5];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[14], q[13];
cx q[13], q[12];
cx q[18], q[11];
cx q[19], q[18];
cx q[17], q[18];
cx q[14], q[16];
cx q[4], q[6];
cx q[6], q[12];
cx q[12], q[18];
cx q[3], q[4];
