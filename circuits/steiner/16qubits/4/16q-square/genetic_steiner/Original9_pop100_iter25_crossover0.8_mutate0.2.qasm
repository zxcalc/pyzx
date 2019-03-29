// Initial wiring: [5, 3, 4, 10, 11, 2, 8, 13, 6, 12, 7, 15, 14, 9, 1, 0]
// Resulting wiring: [5, 3, 4, 10, 11, 2, 8, 13, 6, 12, 7, 15, 14, 9, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[10];
cx q[7], q[8];
cx q[4], q[5];
cx q[5], q[6];
