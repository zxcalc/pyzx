// Initial wiring: [8, 12, 0, 6, 1, 7, 5, 13, 9, 2, 15, 14, 3, 4, 10, 11]
// Resulting wiring: [8, 12, 0, 6, 1, 7, 5, 13, 9, 2, 15, 14, 3, 4, 10, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[10], q[9];
cx q[4], q[11];
cx q[0], q[1];
