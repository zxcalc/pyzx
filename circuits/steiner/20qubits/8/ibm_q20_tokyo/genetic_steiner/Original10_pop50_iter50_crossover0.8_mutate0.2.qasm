// Initial wiring: [6, 8, 14, 16, 12, 11, 10, 19, 13, 17, 15, 7, 1, 3, 4, 5, 2, 9, 0, 18]
// Resulting wiring: [6, 8, 14, 16, 12, 11, 10, 19, 13, 17, 15, 7, 1, 3, 4, 5, 2, 9, 0, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[5], q[3];
cx q[8], q[2];
cx q[16], q[17];
cx q[17], q[18];
cx q[14], q[16];
cx q[14], q[15];
cx q[8], q[10];
