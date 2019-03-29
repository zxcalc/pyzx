// Initial wiring: [10, 1, 15, 4, 13, 6, 8, 5, 7, 11, 9, 12, 3, 0, 2, 14]
// Resulting wiring: [10, 1, 15, 4, 13, 6, 8, 5, 7, 11, 9, 12, 3, 0, 2, 14]
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
