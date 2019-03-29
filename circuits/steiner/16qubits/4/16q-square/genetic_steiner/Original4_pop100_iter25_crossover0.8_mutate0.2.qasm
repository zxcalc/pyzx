// Initial wiring: [13, 3, 9, 5, 1, 11, 12, 2, 14, 15, 7, 10, 8, 4, 6, 0]
// Resulting wiring: [13, 3, 9, 5, 1, 11, 12, 2, 14, 15, 7, 10, 8, 4, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[5], q[10];
cx q[2], q[3];
cx q[0], q[1];
