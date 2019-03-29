// Initial wiring: [3, 14, 5, 4, 7, 13, 10, 12, 11, 9, 8, 1, 2, 0, 6, 15]
// Resulting wiring: [3, 14, 5, 4, 7, 13, 10, 12, 11, 9, 8, 1, 2, 0, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[9];
cx q[5], q[6];
cx q[2], q[5];
cx q[0], q[7];
