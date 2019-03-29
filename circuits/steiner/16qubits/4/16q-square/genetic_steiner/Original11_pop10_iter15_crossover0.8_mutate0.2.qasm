// Initial wiring: [2, 13, 7, 15, 8, 3, 4, 1, 12, 9, 10, 6, 14, 0, 11, 5]
// Resulting wiring: [2, 13, 7, 15, 8, 3, 4, 1, 12, 9, 10, 6, 14, 0, 11, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[5];
cx q[10], q[9];
cx q[13], q[10];
cx q[10], q[5];
cx q[13], q[10];
cx q[14], q[15];
cx q[1], q[2];
