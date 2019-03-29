// Initial wiring: [3, 0, 4, 13, 9, 2, 15, 6, 14, 10, 11, 5, 12, 1, 8, 7]
// Resulting wiring: [3, 0, 4, 13, 9, 2, 15, 6, 14, 10, 11, 5, 12, 1, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[10], q[9];
cx q[9], q[8];
cx q[11], q[10];
