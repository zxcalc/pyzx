// Initial wiring: [10, 0, 15, 12, 9, 8, 14, 7, 4, 11, 13, 2, 5, 3, 1, 6]
// Resulting wiring: [10, 0, 15, 12, 9, 8, 14, 7, 4, 11, 13, 2, 5, 3, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[5], q[10];
cx q[3], q[4];
cx q[2], q[3];
