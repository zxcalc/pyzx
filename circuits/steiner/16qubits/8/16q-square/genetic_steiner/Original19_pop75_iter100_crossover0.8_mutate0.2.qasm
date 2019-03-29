// Initial wiring: [1, 8, 15, 13, 7, 11, 4, 2, 0, 14, 12, 6, 5, 10, 9, 3]
// Resulting wiring: [1, 8, 15, 13, 7, 11, 4, 2, 0, 14, 12, 6, 5, 10, 9, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[1];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[5], q[4];
cx q[2], q[1];
cx q[9], q[10];
cx q[0], q[1];
