// Initial wiring: [9, 0, 15, 3, 8, 6, 1, 4, 10, 7, 11, 12, 13, 5, 14, 2]
// Resulting wiring: [9, 0, 15, 3, 8, 6, 1, 4, 10, 7, 11, 12, 13, 5, 14, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[9];
cx q[9], q[8];
cx q[15], q[8];
cx q[5], q[10];
cx q[3], q[4];
cx q[4], q[11];
