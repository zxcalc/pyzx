// Initial wiring: [11, 0, 9, 4, 8, 6, 1, 2, 10, 15, 7, 12, 13, 5, 14, 3]
// Resulting wiring: [11, 0, 9, 4, 8, 6, 1, 2, 10, 15, 7, 12, 13, 5, 14, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[15];
cx q[9], q[14];
cx q[2], q[13];
cx q[0], q[10];
