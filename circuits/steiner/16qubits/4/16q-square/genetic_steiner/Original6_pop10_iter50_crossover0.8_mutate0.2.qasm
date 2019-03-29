// Initial wiring: [1, 13, 4, 6, 14, 10, 12, 2, 15, 8, 11, 5, 9, 3, 7, 0]
// Resulting wiring: [1, 13, 4, 6, 14, 10, 12, 2, 15, 8, 11, 5, 9, 3, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[5], q[4];
cx q[11], q[10];
cx q[1], q[2];
