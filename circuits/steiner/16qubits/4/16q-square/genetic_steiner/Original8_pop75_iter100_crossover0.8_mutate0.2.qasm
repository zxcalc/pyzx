// Initial wiring: [0, 6, 2, 5, 1, 13, 12, 4, 7, 8, 11, 3, 14, 10, 15, 9]
// Resulting wiring: [0, 6, 2, 5, 1, 13, 12, 4, 7, 8, 11, 3, 14, 10, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[4];
cx q[5], q[10];
cx q[10], q[9];
