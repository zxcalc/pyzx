// Initial wiring: [2, 10, 7, 15, 12, 9, 14, 3, 4, 13, 6, 1, 0, 11, 8, 5]
// Resulting wiring: [2, 10, 7, 15, 12, 9, 14, 3, 4, 13, 6, 1, 0, 11, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[9];
cx q[14], q[13];
cx q[9], q[10];
cx q[2], q[5];
