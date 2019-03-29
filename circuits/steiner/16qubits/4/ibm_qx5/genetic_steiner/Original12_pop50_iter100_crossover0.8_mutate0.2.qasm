// Initial wiring: [11, 1, 9, 12, 3, 6, 7, 10, 0, 13, 8, 2, 5, 15, 4, 14]
// Resulting wiring: [11, 1, 9, 12, 3, 6, 7, 10, 0, 13, 8, 2, 5, 15, 4, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[15], q[0];
cx q[13], q[14];
cx q[4], q[11];
