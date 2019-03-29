// Initial wiring: [18, 17, 16, 1, 5, 19, 11, 2, 12, 9, 6, 7, 3, 10, 15, 13, 14, 8, 0, 4]
// Resulting wiring: [18, 17, 16, 1, 5, 19, 11, 2, 12, 9, 6, 7, 3, 10, 15, 13, 14, 8, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[17], q[16];
cx q[13], q[16];
cx q[8], q[10];
