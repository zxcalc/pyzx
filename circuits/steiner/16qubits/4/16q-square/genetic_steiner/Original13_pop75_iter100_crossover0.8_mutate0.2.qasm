// Initial wiring: [10, 7, 6, 0, 14, 2, 3, 8, 1, 4, 11, 12, 15, 5, 13, 9]
// Resulting wiring: [10, 7, 6, 0, 14, 2, 3, 8, 1, 4, 11, 12, 15, 5, 13, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[14], q[9];
cx q[5], q[6];
cx q[4], q[11];
