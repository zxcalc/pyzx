// Initial wiring: [15, 2, 13, 4, 11, 5, 6, 12, 10, 8, 1, 9, 14, 0, 7, 3]
// Resulting wiring: [15, 2, 13, 4, 11, 5, 6, 12, 10, 8, 1, 9, 14, 0, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[10];
cx q[3], q[4];
cx q[4], q[11];
cx q[0], q[7];
