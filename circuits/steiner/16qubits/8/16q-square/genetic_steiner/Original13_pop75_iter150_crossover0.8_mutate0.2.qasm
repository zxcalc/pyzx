// Initial wiring: [10, 1, 14, 4, 13, 6, 8, 15, 2, 11, 9, 12, 5, 0, 3, 7]
// Resulting wiring: [10, 1, 14, 4, 13, 6, 8, 15, 2, 11, 9, 12, 5, 0, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[5], q[4];
cx q[9], q[6];
cx q[13], q[10];
cx q[10], q[9];
cx q[10], q[11];
cx q[5], q[10];
cx q[10], q[9];
