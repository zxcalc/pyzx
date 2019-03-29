// Initial wiring: [0, 2, 9, 3, 8, 6, 7, 4, 13, 10, 11, 12, 1, 14, 5, 15]
// Resulting wiring: [0, 2, 9, 3, 8, 6, 7, 4, 13, 10, 11, 12, 1, 14, 5, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[9];
cx q[6], q[9];
cx q[9], q[6];
cx q[5], q[10];
cx q[3], q[4];
cx q[4], q[11];
cx q[1], q[6];
cx q[6], q[9];
cx q[9], q[6];
