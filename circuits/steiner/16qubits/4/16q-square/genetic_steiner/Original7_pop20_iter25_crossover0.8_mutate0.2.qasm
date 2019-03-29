// Initial wiring: [9, 6, 13, 10, 8, 14, 2, 11, 4, 5, 12, 3, 7, 15, 1, 0]
// Resulting wiring: [9, 6, 13, 10, 8, 14, 2, 11, 4, 5, 12, 3, 7, 15, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[0];
cx q[13], q[10];
cx q[9], q[14];
