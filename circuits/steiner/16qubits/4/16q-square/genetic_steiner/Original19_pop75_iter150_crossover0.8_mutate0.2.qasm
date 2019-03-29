// Initial wiring: [3, 5, 8, 10, 9, 15, 11, 1, 6, 14, 4, 13, 0, 2, 12, 7]
// Resulting wiring: [3, 5, 8, 10, 9, 15, 11, 1, 6, 14, 4, 13, 0, 2, 12, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[13], q[10];
cx q[6], q[9];
cx q[5], q[10];
