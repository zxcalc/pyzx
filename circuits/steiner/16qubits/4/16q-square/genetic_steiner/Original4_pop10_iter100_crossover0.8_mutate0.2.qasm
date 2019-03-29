// Initial wiring: [4, 12, 0, 6, 8, 5, 9, 10, 11, 15, 14, 3, 13, 1, 2, 7]
// Resulting wiring: [4, 12, 0, 6, 8, 5, 9, 10, 11, 15, 14, 3, 13, 1, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[12], q[11];
cx q[9], q[10];
cx q[8], q[15];
