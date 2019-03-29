// Initial wiring: [6, 13, 8, 7, 9, 4, 2, 10, 15, 5, 1, 11, 12, 14, 3, 0]
// Resulting wiring: [6, 13, 8, 7, 9, 4, 2, 10, 15, 5, 1, 11, 12, 14, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[15], q[14];
cx q[13], q[14];
cx q[5], q[10];
