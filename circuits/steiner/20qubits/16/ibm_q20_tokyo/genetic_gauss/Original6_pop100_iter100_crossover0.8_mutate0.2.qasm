// Initial wiring: [6, 9, 17, 13, 10, 11, 3, 7, 16, 8, 12, 0, 2, 19, 18, 14, 1, 4, 5, 15]
// Resulting wiring: [6, 9, 17, 13, 10, 11, 3, 7, 16, 8, 12, 0, 2, 19, 18, 14, 1, 4, 5, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[10];
cx q[8], q[0];
cx q[9], q[2];
cx q[11], q[5];
cx q[14], q[0];
cx q[17], q[5];
cx q[19], q[1];
cx q[18], q[16];
cx q[13], q[14];
cx q[17], q[18];
cx q[6], q[10];
cx q[10], q[17];
cx q[6], q[12];
cx q[1], q[5];
