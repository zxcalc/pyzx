// Initial wiring: [1, 7, 15, 13, 3, 11, 6, 5, 9, 12, 4, 2, 8, 14, 10, 0]
// Resulting wiring: [1, 7, 15, 13, 3, 11, 6, 5, 9, 12, 4, 2, 8, 14, 10, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[9], q[14];
cx q[6], q[9];
cx q[9], q[14];
