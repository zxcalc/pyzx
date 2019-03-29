// Initial wiring: [3, 9, 10, 6, 14, 4, 8, 11, 0, 2, 7, 15, 13, 1, 12, 5]
// Resulting wiring: [3, 9, 10, 6, 14, 4, 8, 11, 0, 2, 7, 15, 13, 1, 12, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[2];
cx q[12], q[5];
cx q[15], q[7];
cx q[2], q[4];
