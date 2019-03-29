// Initial wiring: [2, 10, 6, 7, 0, 15, 1, 4, 12, 13, 9, 3, 14, 11, 8, 5]
// Resulting wiring: [2, 10, 6, 7, 0, 15, 1, 4, 12, 13, 9, 3, 14, 11, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[12], q[11];
cx q[13], q[10];
cx q[4], q[11];
