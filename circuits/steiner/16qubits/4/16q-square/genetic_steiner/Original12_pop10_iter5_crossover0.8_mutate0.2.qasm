// Initial wiring: [6, 8, 3, 5, 11, 2, 7, 1, 4, 15, 12, 14, 10, 13, 9, 0]
// Resulting wiring: [6, 8, 3, 5, 11, 2, 7, 1, 4, 15, 12, 14, 10, 13, 9, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[6];
cx q[9], q[8];
cx q[11], q[4];
cx q[2], q[5];
