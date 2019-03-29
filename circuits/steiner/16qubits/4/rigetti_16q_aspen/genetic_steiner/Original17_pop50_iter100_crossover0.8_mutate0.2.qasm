// Initial wiring: [2, 12, 7, 6, 4, 1, 5, 13, 8, 9, 11, 10, 15, 14, 3, 0]
// Resulting wiring: [2, 12, 7, 6, 4, 1, 5, 13, 8, 9, 11, 10, 15, 14, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[15], q[14];
cx q[13], q[14];
cx q[4], q[5];
