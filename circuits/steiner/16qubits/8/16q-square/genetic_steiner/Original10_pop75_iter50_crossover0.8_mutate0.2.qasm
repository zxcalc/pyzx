// Initial wiring: [4, 11, 10, 1, 7, 0, 3, 14, 9, 15, 6, 8, 13, 5, 2, 12]
// Resulting wiring: [4, 11, 10, 1, 7, 0, 3, 14, 9, 15, 6, 8, 13, 5, 2, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[6], q[5];
cx q[7], q[0];
cx q[13], q[10];
cx q[10], q[9];
cx q[15], q[14];
cx q[5], q[10];
cx q[4], q[5];
