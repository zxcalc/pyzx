// Initial wiring: [6, 5, 3, 10, 4, 12, 1, 14, 9, 19, 17, 11, 13, 18, 8, 16, 15, 7, 2, 0]
// Resulting wiring: [6, 5, 3, 10, 4, 12, 1, 14, 9, 19, 17, 11, 13, 18, 8, 16, 15, 7, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[13], q[5];
cx q[14], q[5];
cx q[15], q[5];
cx q[19], q[0];
cx q[18], q[10];
cx q[19], q[16];
cx q[17], q[18];
cx q[12], q[18];
cx q[9], q[11];
cx q[8], q[9];
cx q[5], q[7];
cx q[0], q[7];
cx q[7], q[18];
cx q[4], q[14];
