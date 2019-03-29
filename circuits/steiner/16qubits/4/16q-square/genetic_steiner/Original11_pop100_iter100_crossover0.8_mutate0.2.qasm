// Initial wiring: [8, 0, 13, 6, 2, 7, 3, 15, 11, 12, 10, 9, 1, 4, 14, 5]
// Resulting wiring: [8, 0, 13, 6, 2, 7, 3, 15, 11, 12, 10, 9, 1, 4, 14, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[8], q[15];
cx q[2], q[5];
cx q[1], q[6];
