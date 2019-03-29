// Initial wiring: [9, 15, 3, 1, 5, 7, 10, 6, 4, 12, 14, 13, 11, 8, 2, 0]
// Resulting wiring: [9, 15, 3, 1, 5, 7, 10, 6, 4, 12, 14, 13, 11, 8, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[5], q[2];
cx q[11], q[10];
