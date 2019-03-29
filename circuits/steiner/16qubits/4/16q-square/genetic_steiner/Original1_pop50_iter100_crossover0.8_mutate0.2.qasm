// Initial wiring: [8, 1, 15, 0, 12, 7, 5, 13, 14, 9, 3, 6, 2, 4, 10, 11]
// Resulting wiring: [8, 1, 15, 0, 12, 7, 5, 13, 14, 9, 3, 6, 2, 4, 10, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[7], q[8];
cx q[5], q[10];
cx q[5], q[6];
