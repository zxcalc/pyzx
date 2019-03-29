// Initial wiring: [11, 0, 5, 14, 9, 2, 4, 3, 12, 10, 8, 13, 7, 1, 15, 6]
// Resulting wiring: [11, 0, 5, 14, 9, 2, 4, 3, 12, 10, 8, 13, 7, 1, 15, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[10], q[5];
cx q[5], q[2];
cx q[14], q[13];
cx q[14], q[9];
cx q[4], q[5];
cx q[0], q[1];
