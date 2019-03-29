// Initial wiring: [9, 14, 3, 12, 5, 15, 4, 11, 8, 7, 10, 13, 2, 1, 0, 6]
// Resulting wiring: [9, 14, 3, 12, 5, 15, 4, 11, 8, 7, 10, 13, 2, 1, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[7], q[8];
cx q[4], q[11];
cx q[2], q[3];
