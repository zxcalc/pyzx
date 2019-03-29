// Initial wiring: [5, 15, 9, 1, 2, 3, 13, 0, 8, 4, 11, 10, 7, 6, 12, 14]
// Resulting wiring: [5, 15, 9, 1, 2, 3, 13, 0, 8, 4, 11, 10, 7, 6, 12, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[15], q[14];
cx q[6], q[9];
cx q[4], q[5];
