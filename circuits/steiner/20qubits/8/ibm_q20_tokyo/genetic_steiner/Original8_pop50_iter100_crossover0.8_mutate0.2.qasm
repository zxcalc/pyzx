// Initial wiring: [18, 9, 19, 2, 5, 11, 15, 0, 13, 17, 7, 16, 10, 4, 1, 14, 6, 12, 8, 3]
// Resulting wiring: [18, 9, 19, 2, 5, 11, 15, 0, 13, 17, 7, 16, 10, 4, 1, 14, 6, 12, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[14], q[13];
cx q[17], q[11];
cx q[14], q[16];
cx q[8], q[10];
cx q[6], q[13];
cx q[5], q[14];
cx q[1], q[2];
