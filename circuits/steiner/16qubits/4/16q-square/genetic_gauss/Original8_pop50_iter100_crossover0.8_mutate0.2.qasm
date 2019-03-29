// Initial wiring: [2, 10, 7, 0, 5, 11, 14, 3, 1, 12, 8, 6, 15, 13, 4, 9]
// Resulting wiring: [2, 10, 7, 0, 5, 11, 14, 3, 1, 12, 8, 6, 15, 13, 4, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[3];
cx q[13], q[5];
cx q[13], q[8];
cx q[5], q[10];
