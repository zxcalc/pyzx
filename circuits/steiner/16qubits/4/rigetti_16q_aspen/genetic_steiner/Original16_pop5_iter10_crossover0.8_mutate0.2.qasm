// Initial wiring: [12, 15, 3, 14, 2, 11, 13, 1, 7, 5, 6, 8, 9, 4, 10, 0]
// Resulting wiring: [12, 15, 3, 14, 2, 11, 13, 1, 7, 5, 6, 8, 9, 4, 10, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[6];
cx q[10], q[9];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[9];
