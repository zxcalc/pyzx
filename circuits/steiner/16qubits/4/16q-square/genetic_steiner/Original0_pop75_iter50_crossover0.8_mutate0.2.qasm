// Initial wiring: [5, 2, 9, 0, 6, 11, 7, 1, 10, 12, 15, 8, 13, 4, 3, 14]
// Resulting wiring: [5, 2, 9, 0, 6, 11, 7, 1, 10, 12, 15, 8, 13, 4, 3, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[13], q[10];
cx q[8], q[15];
cx q[15], q[14];
