// Initial wiring: [13, 11, 3, 4, 7, 15, 14, 8, 12, 6, 1, 2, 5, 0, 10, 9]
// Resulting wiring: [13, 11, 3, 4, 7, 15, 14, 8, 12, 6, 1, 2, 5, 0, 10, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[9], q[8];
cx q[9], q[14];
cx q[1], q[2];
