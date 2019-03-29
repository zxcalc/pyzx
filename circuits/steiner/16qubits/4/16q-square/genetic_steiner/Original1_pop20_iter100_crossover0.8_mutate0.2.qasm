// Initial wiring: [10, 0, 8, 15, 1, 5, 6, 2, 4, 14, 7, 3, 12, 9, 13, 11]
// Resulting wiring: [10, 0, 8, 15, 1, 5, 6, 2, 4, 14, 7, 3, 12, 9, 13, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[5];
cx q[14], q[9];
cx q[10], q[11];
