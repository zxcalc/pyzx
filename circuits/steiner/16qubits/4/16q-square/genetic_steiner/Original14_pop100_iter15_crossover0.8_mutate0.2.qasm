// Initial wiring: [0, 6, 12, 14, 8, 11, 10, 13, 15, 7, 3, 2, 1, 4, 9, 5]
// Resulting wiring: [0, 6, 12, 14, 8, 11, 10, 13, 15, 7, 3, 2, 1, 4, 9, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[9];
cx q[5], q[10];
cx q[1], q[6];
cx q[1], q[2];
