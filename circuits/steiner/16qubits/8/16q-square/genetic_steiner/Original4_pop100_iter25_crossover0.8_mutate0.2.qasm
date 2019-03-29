// Initial wiring: [8, 5, 2, 9, 11, 7, 4, 14, 1, 15, 13, 0, 12, 3, 10, 6]
// Resulting wiring: [8, 5, 2, 9, 11, 7, 4, 14, 1, 15, 13, 0, 12, 3, 10, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[1];
cx q[9], q[8];
cx q[9], q[14];
cx q[4], q[11];
cx q[2], q[3];
cx q[3], q[2];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
