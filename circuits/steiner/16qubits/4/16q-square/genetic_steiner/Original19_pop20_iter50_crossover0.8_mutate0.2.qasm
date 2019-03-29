// Initial wiring: [11, 14, 5, 10, 9, 8, 13, 3, 6, 4, 15, 0, 1, 12, 2, 7]
// Resulting wiring: [11, 14, 5, 10, 9, 8, 13, 3, 6, 4, 15, 0, 1, 12, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[14], q[9];
cx q[6], q[9];
cx q[0], q[1];
