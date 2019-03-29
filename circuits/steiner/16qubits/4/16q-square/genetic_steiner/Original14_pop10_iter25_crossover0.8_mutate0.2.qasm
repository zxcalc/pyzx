// Initial wiring: [14, 5, 11, 8, 4, 3, 2, 7, 15, 1, 0, 13, 12, 6, 10, 9]
// Resulting wiring: [14, 5, 11, 8, 4, 3, 2, 7, 15, 1, 0, 13, 12, 6, 10, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[13], q[12];
cx q[13], q[14];
cx q[2], q[5];
