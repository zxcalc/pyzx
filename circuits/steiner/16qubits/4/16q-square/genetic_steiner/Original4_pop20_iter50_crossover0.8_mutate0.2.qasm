// Initial wiring: [4, 7, 11, 8, 1, 5, 13, 3, 15, 6, 9, 2, 0, 12, 10, 14]
// Resulting wiring: [4, 7, 11, 8, 1, 5, 13, 3, 15, 6, 9, 2, 0, 12, 10, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[10], q[5];
cx q[8], q[15];
cx q[6], q[7];
