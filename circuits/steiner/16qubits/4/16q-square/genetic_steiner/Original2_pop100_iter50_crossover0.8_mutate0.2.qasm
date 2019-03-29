// Initial wiring: [2, 1, 5, 3, 14, 7, 9, 12, 4, 6, 13, 11, 8, 15, 10, 0]
// Resulting wiring: [2, 1, 5, 3, 14, 7, 9, 12, 4, 6, 13, 11, 8, 15, 10, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[9], q[8];
cx q[12], q[11];
cx q[5], q[6];
