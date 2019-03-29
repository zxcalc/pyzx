// Initial wiring: [12, 9, 0, 5, 1, 2, 6, 8, 11, 13, 15, 14, 10, 3, 4, 7]
// Resulting wiring: [12, 9, 0, 5, 1, 2, 6, 8, 11, 13, 15, 14, 10, 3, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[7], q[6];
cx q[6], q[1];
cx q[8], q[7];
cx q[9], q[8];
cx q[9], q[14];
cx q[6], q[9];
cx q[9], q[8];
