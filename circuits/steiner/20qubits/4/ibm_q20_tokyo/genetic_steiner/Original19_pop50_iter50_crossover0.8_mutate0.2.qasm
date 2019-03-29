// Initial wiring: [8, 0, 3, 10, 1, 6, 16, 5, 18, 17, 4, 19, 13, 11, 2, 9, 7, 12, 15, 14]
// Resulting wiring: [8, 0, 3, 10, 1, 6, 16, 5, 18, 17, 4, 19, 13, 11, 2, 9, 7, 12, 15, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[17], q[16];
cx q[10], q[11];
cx q[3], q[4];
