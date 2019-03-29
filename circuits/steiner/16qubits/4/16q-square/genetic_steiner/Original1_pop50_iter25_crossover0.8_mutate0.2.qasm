// Initial wiring: [4, 3, 7, 5, 1, 0, 14, 12, 15, 13, 11, 9, 6, 8, 10, 2]
// Resulting wiring: [4, 3, 7, 5, 1, 0, 14, 12, 15, 13, 11, 9, 6, 8, 10, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[9], q[6];
cx q[3], q[4];
cx q[2], q[3];
