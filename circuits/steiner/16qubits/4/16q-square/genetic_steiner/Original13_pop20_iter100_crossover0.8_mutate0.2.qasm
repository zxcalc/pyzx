// Initial wiring: [4, 13, 8, 9, 12, 14, 6, 11, 5, 0, 3, 7, 10, 2, 1, 15]
// Resulting wiring: [4, 13, 8, 9, 12, 14, 6, 11, 5, 0, 3, 7, 10, 2, 1, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[4];
cx q[7], q[0];
cx q[13], q[10];
