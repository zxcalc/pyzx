// Initial wiring: [5, 1, 15, 3, 7, 11, 8, 0, 13, 14, 12, 6, 2, 10, 4, 9]
// Resulting wiring: [5, 1, 15, 3, 7, 11, 8, 0, 13, 14, 12, 6, 2, 10, 4, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[4];
cx q[5], q[2];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[9], q[14];
cx q[9], q[10];
cx q[5], q[6];
cx q[1], q[6];
