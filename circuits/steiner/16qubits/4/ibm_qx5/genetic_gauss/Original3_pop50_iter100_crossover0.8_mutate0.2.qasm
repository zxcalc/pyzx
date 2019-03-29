// Initial wiring: [1, 9, 13, 0, 11, 14, 6, 8, 3, 5, 2, 4, 12, 10, 15, 7]
// Resulting wiring: [1, 9, 13, 0, 11, 14, 6, 8, 3, 5, 2, 4, 12, 10, 15, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[10];
cx q[9], q[15];
cx q[7], q[12];
cx q[0], q[5];
