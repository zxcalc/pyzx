// Initial wiring: [3, 12, 15, 4, 1, 5, 0, 13, 2, 7, 10, 9, 11, 6, 8, 14]
// Resulting wiring: [3, 12, 15, 4, 1, 5, 0, 13, 2, 7, 10, 9, 11, 6, 8, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[3], q[12];
cx q[12], q[11];
