// Initial wiring: [8, 7, 11, 6, 3, 15, 9, 12, 14, 0, 4, 13, 10, 5, 1, 2]
// Resulting wiring: [8, 7, 11, 6, 3, 15, 9, 12, 14, 0, 4, 13, 10, 5, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[9], q[8];
cx q[11], q[4];
cx q[12], q[11];
cx q[14], q[15];
cx q[9], q[14];
cx q[5], q[10];
cx q[4], q[5];
cx q[5], q[10];
