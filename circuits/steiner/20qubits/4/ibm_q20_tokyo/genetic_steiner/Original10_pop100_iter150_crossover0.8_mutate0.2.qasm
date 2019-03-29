// Initial wiring: [11, 7, 6, 4, 18, 5, 1, 2, 12, 8, 13, 16, 17, 14, 9, 3, 19, 15, 10, 0]
// Resulting wiring: [11, 7, 6, 4, 18, 5, 1, 2, 12, 8, 13, 16, 17, 14, 9, 3, 19, 15, 10, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[10], q[9];
cx q[2], q[3];
cx q[3], q[5];
