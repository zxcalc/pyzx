// Initial wiring: [5, 6, 13, 10, 8, 15, 4, 14, 11, 7, 2, 0, 12, 3, 9, 1]
// Resulting wiring: [5, 6, 13, 10, 8, 15, 4, 14, 11, 7, 2, 0, 12, 3, 9, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[15], q[8];
cx q[7], q[8];
cx q[5], q[6];
