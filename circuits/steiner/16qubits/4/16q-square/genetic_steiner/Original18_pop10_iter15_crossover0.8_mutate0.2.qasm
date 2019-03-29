// Initial wiring: [3, 13, 9, 2, 15, 12, 8, 11, 7, 5, 10, 6, 1, 14, 4, 0]
// Resulting wiring: [3, 13, 9, 2, 15, 12, 8, 11, 7, 5, 10, 6, 1, 14, 4, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[2];
cx q[6], q[1];
cx q[4], q[5];
