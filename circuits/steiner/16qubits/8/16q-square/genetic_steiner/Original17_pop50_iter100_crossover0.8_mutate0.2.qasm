// Initial wiring: [14, 7, 6, 13, 9, 1, 4, 11, 0, 8, 15, 5, 3, 10, 12, 2]
// Resulting wiring: [14, 7, 6, 13, 9, 1, 4, 11, 0, 8, 15, 5, 3, 10, 12, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[8], q[7];
cx q[7], q[0];
cx q[9], q[6];
cx q[9], q[14];
cx q[9], q[10];
cx q[2], q[5];
cx q[5], q[4];
