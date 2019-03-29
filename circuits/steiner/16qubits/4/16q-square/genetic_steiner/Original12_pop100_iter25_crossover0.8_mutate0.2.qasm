// Initial wiring: [4, 15, 13, 12, 2, 3, 0, 7, 9, 10, 14, 11, 1, 8, 5, 6]
// Resulting wiring: [4, 15, 13, 12, 2, 3, 0, 7, 9, 10, 14, 11, 1, 8, 5, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[4];
cx q[12], q[11];
cx q[10], q[11];
