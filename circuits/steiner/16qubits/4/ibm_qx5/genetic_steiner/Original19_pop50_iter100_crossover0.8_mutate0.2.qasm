// Initial wiring: [10, 1, 8, 12, 13, 4, 15, 11, 14, 7, 2, 0, 6, 3, 9, 5]
// Resulting wiring: [10, 1, 8, 12, 13, 4, 15, 11, 14, 7, 2, 0, 6, 3, 9, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[10], q[5];
cx q[7], q[8];
cx q[4], q[5];
