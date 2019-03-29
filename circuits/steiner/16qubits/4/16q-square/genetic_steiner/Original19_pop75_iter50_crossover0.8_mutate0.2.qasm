// Initial wiring: [8, 3, 9, 1, 10, 11, 0, 6, 7, 2, 14, 12, 5, 13, 4, 15]
// Resulting wiring: [8, 3, 9, 1, 10, 11, 0, 6, 7, 2, 14, 12, 5, 13, 4, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[14];
cx q[13], q[14];
cx q[9], q[14];
cx q[5], q[10];
