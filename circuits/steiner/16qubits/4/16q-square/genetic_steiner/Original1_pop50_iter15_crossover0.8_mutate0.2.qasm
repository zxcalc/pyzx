// Initial wiring: [2, 0, 12, 3, 7, 5, 1, 11, 8, 6, 14, 4, 10, 13, 15, 9]
// Resulting wiring: [2, 0, 12, 3, 7, 5, 1, 11, 8, 6, 14, 4, 10, 13, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[13], q[10];
cx q[5], q[6];
cx q[4], q[5];
