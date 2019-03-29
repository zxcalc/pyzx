// Initial wiring: [12, 7, 2, 3, 5, 13, 11, 15, 4, 8, 1, 9, 10, 6, 0, 14]
// Resulting wiring: [12, 7, 2, 3, 5, 13, 11, 15, 4, 8, 1, 9, 10, 6, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[14];
cx q[5], q[6];
cx q[5], q[10];
cx q[6], q[9];
