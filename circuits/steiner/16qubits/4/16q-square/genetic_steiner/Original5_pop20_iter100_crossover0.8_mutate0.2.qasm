// Initial wiring: [2, 5, 7, 15, 3, 12, 13, 10, 4, 14, 8, 1, 9, 11, 6, 0]
// Resulting wiring: [2, 5, 7, 15, 3, 12, 13, 10, 4, 14, 8, 1, 9, 11, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[6], q[7];
cx q[4], q[5];
cx q[1], q[6];
