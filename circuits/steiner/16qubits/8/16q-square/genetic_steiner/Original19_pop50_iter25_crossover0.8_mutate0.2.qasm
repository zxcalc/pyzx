// Initial wiring: [0, 15, 7, 3, 10, 11, 8, 1, 14, 4, 12, 5, 13, 9, 2, 6]
// Resulting wiring: [0, 15, 7, 3, 10, 11, 8, 1, 14, 4, 12, 5, 13, 9, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[6];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[2], q[1];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[5], q[6];
