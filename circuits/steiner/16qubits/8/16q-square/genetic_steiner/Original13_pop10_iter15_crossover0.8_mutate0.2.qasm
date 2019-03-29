// Initial wiring: [10, 12, 9, 0, 7, 6, 8, 2, 4, 11, 13, 14, 1, 3, 15, 5]
// Resulting wiring: [10, 12, 9, 0, 7, 6, 8, 2, 4, 11, 13, 14, 1, 3, 15, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[2], q[1];
cx q[6], q[5];
cx q[5], q[2];
cx q[9], q[8];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[8];
cx q[5], q[10];
cx q[10], q[9];
