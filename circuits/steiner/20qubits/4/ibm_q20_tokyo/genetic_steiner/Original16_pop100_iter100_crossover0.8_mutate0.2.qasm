// Initial wiring: [5, 0, 18, 7, 12, 10, 1, 15, 13, 6, 9, 17, 16, 2, 11, 4, 19, 8, 3, 14]
// Resulting wiring: [5, 0, 18, 7, 12, 10, 1, 15, 13, 6, 9, 17, 16, 2, 11, 4, 19, 8, 3, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[15], q[16];
cx q[10], q[11];
cx q[7], q[8];
