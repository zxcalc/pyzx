// Initial wiring: [6, 7, 11, 15, 9, 0, 14, 5, 8, 2, 12, 1, 3, 10, 4, 13]
// Resulting wiring: [6, 7, 11, 15, 9, 0, 14, 5, 8, 2, 12, 1, 3, 10, 4, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[6];
cx q[9], q[14];
cx q[5], q[6];
cx q[5], q[10];
cx q[6], q[7];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[10];
