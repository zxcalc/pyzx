// Initial wiring: [5, 10, 12, 4, 13, 11, 6, 7, 1, 2, 9, 14, 0, 3, 15, 8]
// Resulting wiring: [5, 10, 12, 4, 13, 11, 6, 7, 1, 2, 9, 14, 0, 3, 15, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[13], q[14];
cx q[8], q[9];
cx q[4], q[5];
