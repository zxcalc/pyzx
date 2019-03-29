// Initial wiring: [14, 4, 11, 8, 2, 12, 15, 6, 0, 5, 3, 10, 1, 13, 9, 7]
// Resulting wiring: [14, 4, 11, 8, 2, 12, 15, 6, 0, 5, 3, 10, 1, 13, 9, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[8], q[7];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[9];
cx q[15], q[8];
cx q[0], q[1];
