// Initial wiring: [11, 7, 5, 15, 2, 13, 6, 9, 3, 12, 8, 14, 1, 0, 4, 10]
// Resulting wiring: [11, 7, 5, 15, 2, 13, 6, 9, 3, 12, 8, 14, 1, 0, 4, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[10], q[9];
cx q[12], q[11];
cx q[3], q[4];
