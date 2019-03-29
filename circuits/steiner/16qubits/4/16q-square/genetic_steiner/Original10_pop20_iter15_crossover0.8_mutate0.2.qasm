// Initial wiring: [11, 12, 8, 13, 4, 1, 0, 6, 14, 7, 9, 3, 5, 15, 2, 10]
// Resulting wiring: [11, 12, 8, 13, 4, 1, 0, 6, 14, 7, 9, 3, 5, 15, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[10], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[2], q[5];
cx q[5], q[4];
