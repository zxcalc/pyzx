// Initial wiring: [9, 10, 2, 3, 11, 6, 12, 7, 0, 8, 15, 5, 1, 13, 4, 14]
// Resulting wiring: [9, 10, 2, 3, 11, 6, 12, 7, 0, 8, 15, 5, 1, 13, 4, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[12], q[4];
cx q[15], q[4];
cx q[10], q[14];
