// Initial wiring: [9, 0, 8, 11, 5, 13, 10, 4, 1, 15, 6, 14, 2, 12, 3, 7]
// Resulting wiring: [9, 0, 8, 11, 5, 13, 10, 4, 1, 15, 6, 14, 2, 12, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[14], q[13];
cx q[5], q[6];
cx q[4], q[5];
