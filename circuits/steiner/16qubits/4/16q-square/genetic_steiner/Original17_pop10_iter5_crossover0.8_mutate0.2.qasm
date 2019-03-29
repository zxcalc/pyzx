// Initial wiring: [5, 2, 1, 6, 9, 4, 15, 7, 12, 3, 13, 8, 10, 11, 14, 0]
// Resulting wiring: [5, 2, 1, 6, 9, 4, 15, 7, 12, 3, 13, 8, 10, 11, 14, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[13], q[10];
cx q[15], q[14];
cx q[14], q[9];
cx q[15], q[14];
