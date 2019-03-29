// Initial wiring: [13, 3, 11, 7, 6, 12, 15, 5, 14, 2, 0, 9, 8, 1, 4, 10]
// Resulting wiring: [13, 3, 11, 7, 6, 12, 15, 5, 14, 2, 0, 9, 8, 1, 4, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[9];
cx q[9], q[14];
cx q[5], q[10];
cx q[3], q[4];
cx q[2], q[5];
cx q[5], q[10];
