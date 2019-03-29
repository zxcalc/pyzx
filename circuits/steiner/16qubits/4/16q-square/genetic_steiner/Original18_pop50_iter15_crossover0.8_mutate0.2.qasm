// Initial wiring: [7, 5, 2, 11, 0, 9, 1, 4, 6, 13, 12, 14, 3, 15, 8, 10]
// Resulting wiring: [7, 5, 2, 11, 0, 9, 1, 4, 6, 13, 12, 14, 3, 15, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[13], q[10];
cx q[14], q[9];
cx q[2], q[5];
