// Initial wiring: [3, 0, 8, 10, 11, 13, 6, 7, 2, 9, 12, 5, 14, 15, 4, 1]
// Resulting wiring: [3, 0, 8, 10, 11, 13, 6, 7, 2, 9, 12, 5, 14, 15, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[13], q[10];
cx q[8], q[9];
cx q[2], q[5];
