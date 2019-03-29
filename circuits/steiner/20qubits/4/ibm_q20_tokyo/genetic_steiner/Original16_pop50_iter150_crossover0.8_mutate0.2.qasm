// Initial wiring: [2, 10, 16, 9, 11, 0, 17, 8, 3, 12, 1, 18, 19, 15, 6, 7, 13, 4, 5, 14]
// Resulting wiring: [2, 10, 16, 9, 11, 0, 17, 8, 3, 12, 1, 18, 19, 15, 6, 7, 13, 4, 5, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[17], q[12];
cx q[13], q[16];
cx q[3], q[6];
