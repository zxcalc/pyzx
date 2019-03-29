// Initial wiring: [15, 7, 13, 1, 4, 6, 10, 14, 12, 3, 11, 5, 9, 2, 0, 8]
// Resulting wiring: [15, 7, 13, 1, 4, 6, 10, 14, 12, 3, 11, 5, 9, 2, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[5];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[15], q[14];
cx q[4], q[5];
