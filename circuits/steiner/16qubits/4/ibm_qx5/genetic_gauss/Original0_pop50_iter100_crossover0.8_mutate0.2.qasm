// Initial wiring: [1, 2, 13, 6, 5, 14, 0, 12, 3, 11, 15, 10, 8, 9, 7, 4]
// Resulting wiring: [1, 2, 13, 6, 5, 14, 0, 12, 3, 11, 15, 10, 8, 9, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[5];
cx q[15], q[10];
cx q[0], q[4];
cx q[5], q[8];
