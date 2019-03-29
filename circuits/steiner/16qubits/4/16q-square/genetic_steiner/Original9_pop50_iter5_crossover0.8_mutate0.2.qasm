// Initial wiring: [1, 8, 2, 5, 15, 11, 4, 10, 13, 14, 7, 9, 3, 12, 0, 6]
// Resulting wiring: [1, 8, 2, 5, 15, 11, 4, 10, 13, 14, 7, 9, 3, 12, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[2], q[1];
cx q[13], q[10];
cx q[8], q[15];
