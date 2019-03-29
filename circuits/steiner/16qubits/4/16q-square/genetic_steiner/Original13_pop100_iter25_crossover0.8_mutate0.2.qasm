// Initial wiring: [15, 5, 0, 12, 14, 3, 1, 9, 13, 4, 2, 10, 8, 6, 11, 7]
// Resulting wiring: [15, 5, 0, 12, 14, 3, 1, 9, 13, 4, 2, 10, 8, 6, 11, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[10], q[5];
cx q[14], q[9];
cx q[8], q[9];
