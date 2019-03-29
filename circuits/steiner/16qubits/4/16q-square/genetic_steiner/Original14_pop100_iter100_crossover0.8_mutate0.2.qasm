// Initial wiring: [0, 5, 15, 7, 11, 3, 12, 6, 10, 13, 2, 14, 8, 4, 9, 1]
// Resulting wiring: [0, 5, 15, 7, 11, 3, 12, 6, 10, 13, 2, 14, 8, 4, 9, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[7], q[8];
cx q[4], q[5];
cx q[2], q[3];
