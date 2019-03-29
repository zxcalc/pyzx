// Initial wiring: [14, 11, 8, 2, 10, 1, 7, 9, 3, 12, 5, 13, 15, 4, 6, 0]
// Resulting wiring: [14, 11, 8, 2, 10, 1, 7, 9, 3, 12, 5, 13, 15, 4, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[10], q[11];
cx q[8], q[9];
cx q[1], q[2];
