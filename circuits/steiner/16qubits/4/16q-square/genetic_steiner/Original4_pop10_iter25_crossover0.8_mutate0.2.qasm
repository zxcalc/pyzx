// Initial wiring: [3, 13, 9, 15, 14, 5, 7, 8, 0, 11, 6, 12, 10, 4, 1, 2]
// Resulting wiring: [3, 13, 9, 15, 14, 5, 7, 8, 0, 11, 6, 12, 10, 4, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[6];
cx q[3], q[4];
cx q[2], q[5];
