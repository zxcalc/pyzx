// Initial wiring: [9, 10, 14, 2, 11, 3, 13, 0, 7, 12, 5, 8, 6, 1, 4, 15]
// Resulting wiring: [9, 10, 14, 2, 11, 3, 13, 0, 7, 12, 5, 8, 6, 1, 4, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[14], q[15];
cx q[1], q[2];
cx q[2], q[5];
