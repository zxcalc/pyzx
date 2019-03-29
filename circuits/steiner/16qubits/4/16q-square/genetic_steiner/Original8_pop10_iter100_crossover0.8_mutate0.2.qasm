// Initial wiring: [4, 3, 2, 1, 13, 11, 7, 9, 5, 15, 8, 12, 14, 10, 6, 0]
// Resulting wiring: [4, 3, 2, 1, 13, 11, 7, 9, 5, 15, 8, 12, 14, 10, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[14], q[15];
cx q[4], q[5];
cx q[5], q[10];
