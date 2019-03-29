// Initial wiring: [1, 0, 5, 13, 12, 3, 14, 4, 15, 11, 8, 9, 10, 2, 6, 7]
// Resulting wiring: [1, 0, 5, 13, 12, 3, 14, 4, 15, 11, 8, 9, 10, 2, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[9], q[10];
cx q[3], q[12];
cx q[2], q[3];
