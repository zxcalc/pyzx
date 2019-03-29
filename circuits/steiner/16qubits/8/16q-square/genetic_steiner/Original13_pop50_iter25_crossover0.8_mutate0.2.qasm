// Initial wiring: [10, 6, 8, 5, 14, 11, 4, 15, 2, 13, 9, 12, 7, 0, 3, 1]
// Resulting wiring: [10, 6, 8, 5, 14, 11, 4, 15, 2, 13, 9, 12, 7, 0, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[9], q[6];
cx q[13], q[10];
cx q[10], q[9];
cx q[10], q[11];
cx q[5], q[10];
cx q[2], q[5];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[9];
cx q[5], q[2];
