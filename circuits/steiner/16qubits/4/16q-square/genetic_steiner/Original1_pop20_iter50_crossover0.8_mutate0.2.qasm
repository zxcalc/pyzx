// Initial wiring: [1, 5, 7, 8, 2, 3, 15, 4, 6, 12, 10, 11, 9, 13, 14, 0]
// Resulting wiring: [1, 5, 7, 8, 2, 3, 15, 4, 6, 12, 10, 11, 9, 13, 14, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[13], q[14];
cx q[2], q[5];
