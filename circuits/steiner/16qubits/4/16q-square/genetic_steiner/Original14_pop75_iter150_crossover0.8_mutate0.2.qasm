// Initial wiring: [3, 1, 12, 14, 10, 6, 9, 11, 13, 4, 7, 2, 5, 15, 8, 0]
// Resulting wiring: [3, 1, 12, 14, 10, 6, 9, 11, 13, 4, 7, 2, 5, 15, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[7], q[0];
cx q[13], q[10];
