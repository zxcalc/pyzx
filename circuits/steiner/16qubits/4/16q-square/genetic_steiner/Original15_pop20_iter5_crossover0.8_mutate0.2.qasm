// Initial wiring: [8, 6, 10, 7, 15, 5, 4, 1, 0, 12, 9, 13, 2, 11, 3, 14]
// Resulting wiring: [8, 6, 10, 7, 15, 5, 4, 1, 0, 12, 9, 13, 2, 11, 3, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[12], q[11];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[9];
cx q[9], q[6];
cx q[15], q[14];
cx q[2], q[5];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[2];
