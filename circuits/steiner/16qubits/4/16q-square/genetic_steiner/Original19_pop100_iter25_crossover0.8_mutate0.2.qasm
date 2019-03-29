// Initial wiring: [5, 12, 6, 0, 14, 11, 13, 9, 8, 4, 2, 1, 10, 3, 15, 7]
// Resulting wiring: [5, 12, 6, 0, 14, 11, 13, 9, 8, 4, 2, 1, 10, 3, 15, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[9];
cx q[14], q[9];
cx q[6], q[9];
