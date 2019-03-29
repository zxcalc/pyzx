// Initial wiring: [0, 3, 6, 7, 10, 1, 9, 11, 14, 8, 4, 12, 2, 5, 15, 13]
// Resulting wiring: [0, 3, 6, 7, 10, 1, 9, 11, 14, 8, 4, 12, 2, 5, 15, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[10], q[11];
cx q[9], q[10];
cx q[9], q[14];
cx q[10], q[11];
cx q[2], q[5];
cx q[5], q[6];
cx q[0], q[7];
cx q[7], q[8];
