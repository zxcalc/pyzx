// Initial wiring: [2, 6, 5, 15, 13, 4, 3, 12, 11, 7, 8, 1, 9, 10, 0, 14]
// Resulting wiring: [2, 6, 5, 15, 13, 4, 3, 12, 11, 7, 8, 1, 9, 10, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[4];
cx q[10], q[11];
