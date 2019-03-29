// Initial wiring: [0, 10, 5, 2, 14, 4, 8, 1, 7, 11, 12, 13, 6, 3, 15, 9]
// Resulting wiring: [0, 10, 5, 2, 14, 4, 8, 1, 7, 11, 12, 13, 6, 3, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[10], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[9], q[14];
cx q[5], q[10];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[10];
