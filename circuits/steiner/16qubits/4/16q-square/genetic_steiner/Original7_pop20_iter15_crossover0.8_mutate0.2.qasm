// Initial wiring: [4, 11, 9, 8, 2, 12, 15, 0, 10, 13, 1, 6, 3, 5, 7, 14]
// Resulting wiring: [4, 11, 9, 8, 2, 12, 15, 0, 10, 13, 1, 6, 3, 5, 7, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[13], q[10];
cx q[0], q[1];
cx q[1], q[2];
