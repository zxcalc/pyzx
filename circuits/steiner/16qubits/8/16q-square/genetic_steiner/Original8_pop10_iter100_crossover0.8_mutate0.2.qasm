// Initial wiring: [14, 11, 10, 2, 6, 3, 8, 5, 12, 1, 13, 4, 0, 9, 7, 15]
// Resulting wiring: [14, 11, 10, 2, 6, 3, 8, 5, 12, 1, 13, 4, 0, 9, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[9], q[8];
cx q[14], q[9];
cx q[14], q[15];
cx q[9], q[14];
cx q[5], q[10];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[10];
cx q[5], q[4];
cx q[3], q[4];
cx q[2], q[5];
cx q[5], q[4];
