// Initial wiring: [16, 17, 13, 8, 6, 18, 1, 9, 7, 2, 12, 14, 15, 0, 5, 4, 19, 3, 10, 11]
// Resulting wiring: [16, 17, 13, 8, 6, 18, 1, 9, 7, 2, 12, 14, 15, 0, 5, 4, 19, 3, 10, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[12], q[7];
cx q[14], q[5];
cx q[17], q[11];
cx q[18], q[11];
cx q[19], q[10];
cx q[14], q[15];
cx q[13], q[16];
