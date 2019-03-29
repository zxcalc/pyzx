// Initial wiring: [14, 13, 10, 11, 5, 12, 7, 4, 1, 0, 9, 15, 2, 8, 3, 6]
// Resulting wiring: [14, 13, 10, 11, 5, 12, 7, 4, 1, 0, 9, 15, 2, 8, 3, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[14];
cx q[3], q[4];
cx q[2], q[5];
cx q[1], q[6];
