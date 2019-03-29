// Initial wiring: [11, 12, 5, 14, 6, 3, 8, 9, 0, 1, 15, 10, 4, 2, 16, 18, 7, 13, 19, 17]
// Resulting wiring: [11, 12, 5, 14, 6, 3, 8, 9, 0, 1, 15, 10, 4, 2, 16, 18, 7, 13, 19, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[8];
cx q[10], q[19];
cx q[10], q[16];
cx q[5], q[6];
