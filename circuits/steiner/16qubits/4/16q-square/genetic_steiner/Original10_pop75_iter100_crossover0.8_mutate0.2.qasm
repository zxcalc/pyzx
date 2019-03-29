// Initial wiring: [6, 5, 15, 0, 13, 4, 2, 10, 12, 7, 8, 1, 9, 3, 11, 14]
// Resulting wiring: [6, 5, 15, 0, 13, 4, 2, 10, 12, 7, 8, 1, 9, 3, 11, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[4];
cx q[10], q[11];
