// Initial wiring: [4, 13, 8, 9, 10, 1, 12, 15, 2, 0, 11, 14, 7, 5, 6, 3]
// Resulting wiring: [4, 13, 8, 9, 10, 1, 12, 15, 2, 0, 11, 14, 7, 5, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[11], q[10];
cx q[15], q[8];
cx q[5], q[10];
