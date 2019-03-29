// Initial wiring: [3, 15, 9, 12, 1, 10, 0, 8, 13, 7, 6, 2, 4, 14, 5, 11]
// Resulting wiring: [3, 15, 9, 12, 1, 10, 0, 8, 13, 7, 6, 2, 4, 14, 5, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[10];
cx q[8], q[15];
cx q[4], q[11];
cx q[0], q[1];
