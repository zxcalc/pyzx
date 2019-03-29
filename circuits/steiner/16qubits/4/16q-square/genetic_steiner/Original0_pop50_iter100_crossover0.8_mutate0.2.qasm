// Initial wiring: [0, 11, 10, 9, 13, 14, 5, 12, 7, 1, 3, 8, 6, 2, 4, 15]
// Resulting wiring: [0, 11, 10, 9, 13, 14, 5, 12, 7, 1, 3, 8, 6, 2, 4, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[14], q[15];
cx q[2], q[5];
cx q[5], q[10];
