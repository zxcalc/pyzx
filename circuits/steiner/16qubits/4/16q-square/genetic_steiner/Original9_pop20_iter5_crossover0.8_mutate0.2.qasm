// Initial wiring: [6, 13, 9, 10, 15, 4, 14, 12, 11, 7, 3, 0, 1, 8, 2, 5]
// Resulting wiring: [6, 13, 9, 10, 15, 4, 14, 12, 11, 7, 3, 0, 1, 8, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[8];
cx q[8], q[9];
cx q[9], q[14];
cx q[14], q[13];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[8];
