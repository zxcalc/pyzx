// Initial wiring: [11, 9, 15, 6, 14, 3, 13, 2, 10, 7, 0, 5, 8, 4, 1, 12]
// Resulting wiring: [11, 9, 15, 6, 14, 3, 13, 2, 10, 7, 0, 5, 8, 4, 1, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[13], q[14];
cx q[4], q[5];
cx q[0], q[1];
