// Initial wiring: [8, 1, 5, 6, 10, 7, 12, 14, 13, 4, 3, 2, 0, 9, 15, 11]
// Resulting wiring: [8, 1, 5, 6, 10, 7, 12, 14, 13, 4, 3, 2, 0, 9, 15, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[8], q[7];
cx q[5], q[10];
