// Initial wiring: [13, 9, 10, 14, 1, 0, 7, 5, 15, 2, 12, 11, 4, 8, 6, 3]
// Resulting wiring: [13, 9, 10, 14, 1, 0, 7, 5, 15, 2, 12, 11, 4, 8, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[6];
cx q[13], q[10];
cx q[8], q[9];
