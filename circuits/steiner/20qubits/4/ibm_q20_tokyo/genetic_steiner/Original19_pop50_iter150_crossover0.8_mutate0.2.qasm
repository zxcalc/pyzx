// Initial wiring: [3, 6, 18, 5, 16, 17, 14, 2, 9, 12, 7, 1, 13, 4, 11, 15, 19, 10, 0, 8]
// Resulting wiring: [3, 6, 18, 5, 16, 17, 14, 2, 9, 12, 7, 1, 13, 4, 11, 15, 19, 10, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[11];
cx q[13], q[16];
cx q[9], q[10];
cx q[3], q[4];
