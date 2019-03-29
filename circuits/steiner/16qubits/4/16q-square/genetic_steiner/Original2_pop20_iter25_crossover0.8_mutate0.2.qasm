// Initial wiring: [1, 0, 12, 3, 11, 8, 13, 5, 10, 6, 4, 2, 14, 15, 9, 7]
// Resulting wiring: [1, 0, 12, 3, 11, 8, 13, 5, 10, 6, 4, 2, 14, 15, 9, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[15], q[14];
cx q[6], q[9];
cx q[9], q[10];
