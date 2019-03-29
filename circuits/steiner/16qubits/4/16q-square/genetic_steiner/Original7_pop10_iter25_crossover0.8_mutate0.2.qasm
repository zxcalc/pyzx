// Initial wiring: [10, 7, 4, 2, 14, 11, 6, 15, 12, 3, 9, 13, 1, 5, 8, 0]
// Resulting wiring: [10, 7, 4, 2, 14, 11, 6, 15, 12, 3, 9, 13, 1, 5, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[7], q[8];
cx q[2], q[5];
cx q[5], q[10];
