// Initial wiring: [4, 10, 15, 12, 9, 7, 14, 6, 13, 1, 8, 11, 5, 3, 2, 0]
// Resulting wiring: [4, 10, 15, 12, 9, 7, 14, 6, 13, 1, 8, 11, 5, 3, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[8], q[7];
cx q[7], q[0];
cx q[10], q[11];
