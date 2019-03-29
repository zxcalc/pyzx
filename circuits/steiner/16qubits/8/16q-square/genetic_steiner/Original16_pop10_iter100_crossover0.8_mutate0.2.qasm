// Initial wiring: [9, 11, 0, 8, 14, 5, 12, 10, 3, 6, 1, 13, 2, 4, 7, 15]
// Resulting wiring: [9, 11, 0, 8, 14, 5, 12, 10, 3, 6, 1, 13, 2, 4, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[4];
cx q[12], q[11];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[12], q[13];
cx q[4], q[5];
cx q[5], q[4];
cx q[2], q[5];
cx q[5], q[4];
cx q[1], q[6];
cx q[1], q[2];
