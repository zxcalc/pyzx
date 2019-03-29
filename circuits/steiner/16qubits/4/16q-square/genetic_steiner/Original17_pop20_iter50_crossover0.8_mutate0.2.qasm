// Initial wiring: [5, 7, 0, 3, 14, 10, 13, 1, 4, 6, 2, 12, 8, 11, 9, 15]
// Resulting wiring: [5, 7, 0, 3, 14, 10, 13, 1, 4, 6, 2, 12, 8, 11, 9, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[8], q[7];
cx q[13], q[14];
cx q[2], q[3];
