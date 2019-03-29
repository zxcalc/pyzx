// Initial wiring: [2, 0, 10, 9, 1, 5, 15, 11, 8, 3, 7, 14, 13, 12, 4, 6]
// Resulting wiring: [2, 0, 10, 9, 1, 5, 15, 11, 8, 3, 7, 14, 13, 12, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[9];
cx q[10], q[5];
cx q[12], q[11];
