// Initial wiring: [11, 13, 2, 7, 16, 18, 0, 5, 6, 14, 3, 4, 10, 1, 8, 19, 15, 17, 12, 9]
// Resulting wiring: [11, 13, 2, 7, 16, 18, 0, 5, 6, 14, 3, 4, 10, 1, 8, 19, 15, 17, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[13], q[6];
cx q[17], q[16];
cx q[8], q[9];
