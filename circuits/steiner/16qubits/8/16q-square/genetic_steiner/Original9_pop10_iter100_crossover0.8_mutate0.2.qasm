// Initial wiring: [8, 2, 13, 7, 6, 12, 10, 0, 5, 3, 11, 14, 4, 9, 1, 15]
// Resulting wiring: [8, 2, 13, 7, 6, 12, 10, 0, 5, 3, 11, 14, 4, 9, 1, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[5];
cx q[9], q[8];
cx q[15], q[14];
cx q[14], q[9];
cx q[4], q[11];
cx q[1], q[6];
cx q[0], q[1];
cx q[1], q[6];
