// Initial wiring: [13, 0, 2, 14, 12, 4, 10, 9, 1, 8, 11, 5, 3, 7, 15, 6]
// Resulting wiring: [13, 0, 2, 14, 12, 4, 10, 9, 1, 8, 11, 5, 3, 7, 15, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[8], q[9];
cx q[5], q[10];
cx q[10], q[9];
cx q[9], q[14];
cx q[4], q[5];
cx q[5], q[10];
cx q[10], q[9];
cx q[9], q[14];
cx q[10], q[13];
cx q[3], q[4];
cx q[4], q[5];
