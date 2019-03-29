// Initial wiring: [3, 6, 4, 2, 10, 13, 12, 11, 14, 1, 15, 9, 0, 5, 8, 7]
// Resulting wiring: [3, 6, 4, 2, 10, 13, 12, 11, 14, 1, 15, 9, 0, 5, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[7], q[8];
