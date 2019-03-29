// Initial wiring: [10, 12, 8, 1, 3, 11, 7, 9, 2, 15, 5, 0, 13, 6, 4, 14]
// Resulting wiring: [10, 12, 8, 1, 3, 11, 7, 9, 2, 15, 5, 0, 13, 6, 4, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[13];
cx q[13], q[14];
cx q[6], q[7];
cx q[2], q[5];
