// Initial wiring: [11, 14, 0, 6, 3, 4, 1, 7, 10, 9, 12, 13, 8, 15, 2, 5]
// Resulting wiring: [11, 14, 0, 6, 3, 4, 1, 7, 10, 9, 12, 13, 8, 15, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[12], q[11];
cx q[13], q[10];
cx q[14], q[9];
