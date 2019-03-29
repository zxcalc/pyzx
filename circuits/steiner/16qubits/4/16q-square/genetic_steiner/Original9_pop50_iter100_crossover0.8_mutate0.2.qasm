// Initial wiring: [11, 2, 8, 3, 9, 12, 5, 0, 15, 1, 7, 4, 6, 13, 14, 10]
// Resulting wiring: [11, 2, 8, 3, 9, 12, 5, 0, 15, 1, 7, 4, 6, 13, 14, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[5], q[10];
cx q[0], q[1];
cx q[1], q[2];
