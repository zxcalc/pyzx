// Initial wiring: [15, 11, 1, 14, 12, 5, 2, 3, 9, 13, 6, 4, 0, 10, 8, 7]
// Resulting wiring: [15, 11, 1, 14, 12, 5, 2, 3, 9, 13, 6, 4, 0, 10, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[6], q[9];
cx q[3], q[4];
cx q[4], q[11];
