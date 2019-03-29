// Initial wiring: [3, 14, 1, 13, 4, 0, 6, 8, 12, 15, 2, 9, 10, 11, 7, 5]
// Resulting wiring: [3, 14, 1, 13, 4, 0, 6, 8, 12, 15, 2, 9, 10, 11, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[15], q[14];
cx q[9], q[10];
cx q[7], q[8];
