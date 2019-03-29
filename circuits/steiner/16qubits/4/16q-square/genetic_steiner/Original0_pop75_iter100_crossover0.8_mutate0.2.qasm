// Initial wiring: [4, 13, 8, 3, 14, 10, 12, 15, 0, 5, 1, 2, 7, 6, 11, 9]
// Resulting wiring: [4, 13, 8, 3, 14, 10, 12, 15, 0, 5, 1, 2, 7, 6, 11, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[4], q[3];
cx q[10], q[9];
cx q[0], q[7];
