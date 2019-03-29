// Initial wiring: [8, 14, 13, 1, 15, 4, 11, 0, 5, 7, 9, 12, 10, 2, 6, 3]
// Resulting wiring: [8, 14, 13, 1, 15, 4, 11, 0, 5, 7, 9, 12, 10, 2, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[10], q[5];
cx q[13], q[10];
cx q[10], q[5];
cx q[13], q[10];
cx q[4], q[5];
cx q[2], q[5];
