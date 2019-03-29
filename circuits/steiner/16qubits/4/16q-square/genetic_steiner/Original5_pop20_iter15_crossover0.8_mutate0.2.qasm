// Initial wiring: [14, 7, 6, 4, 3, 12, 9, 1, 11, 8, 10, 13, 5, 15, 2, 0]
// Resulting wiring: [14, 7, 6, 4, 3, 12, 9, 1, 11, 8, 10, 13, 5, 15, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[12], q[11];
cx q[8], q[9];
cx q[4], q[5];
