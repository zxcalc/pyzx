// Initial wiring: [6, 9, 3, 10, 14, 8, 11, 15, 4, 0, 5, 1, 12, 2, 13, 7]
// Resulting wiring: [6, 9, 3, 10, 14, 8, 11, 15, 4, 0, 5, 1, 12, 2, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[6];
cx q[7], q[8];
cx q[2], q[13];
cx q[4], q[6];
