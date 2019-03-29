// Initial wiring: [5, 11, 8, 7, 9, 6, 13, 3, 15, 1, 0, 14, 12, 2, 4, 10]
// Resulting wiring: [5, 11, 8, 7, 9, 6, 13, 3, 15, 1, 0, 14, 12, 2, 4, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[6], q[9];
cx q[5], q[10];
cx q[1], q[2];
