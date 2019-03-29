// Initial wiring: [3, 13, 5, 11, 7, 9, 4, 1, 12, 8, 14, 6, 10, 15, 0, 2]
// Resulting wiring: [3, 13, 5, 11, 7, 9, 4, 1, 12, 8, 14, 6, 10, 15, 0, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[2];
cx q[13], q[10];
cx q[3], q[4];
