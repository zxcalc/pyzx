// Initial wiring: [1, 5, 13, 10, 11, 8, 9, 6, 15, 3, 14, 7, 4, 0, 12, 2]
// Resulting wiring: [1, 5, 13, 10, 11, 8, 9, 6, 15, 3, 14, 7, 4, 0, 12, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[14];
cx q[4], q[5];
cx q[2], q[3];
cx q[1], q[2];
