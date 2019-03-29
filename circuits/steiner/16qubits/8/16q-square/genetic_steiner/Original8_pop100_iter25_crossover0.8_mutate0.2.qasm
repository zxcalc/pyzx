// Initial wiring: [2, 6, 13, 10, 5, 8, 3, 9, 15, 7, 12, 0, 14, 11, 1, 4]
// Resulting wiring: [2, 6, 13, 10, 5, 8, 3, 9, 15, 7, 12, 0, 14, 11, 1, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[2], q[1];
cx q[6], q[5];
cx q[9], q[8];
cx q[14], q[9];
cx q[9], q[10];
cx q[1], q[6];
cx q[1], q[2];
cx q[0], q[1];
