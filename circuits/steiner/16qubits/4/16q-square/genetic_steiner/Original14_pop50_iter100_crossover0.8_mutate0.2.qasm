// Initial wiring: [15, 7, 12, 4, 10, 6, 3, 14, 5, 11, 13, 2, 1, 9, 8, 0]
// Resulting wiring: [15, 7, 12, 4, 10, 6, 3, 14, 5, 11, 13, 2, 1, 9, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[9], q[6];
cx q[0], q[1];
