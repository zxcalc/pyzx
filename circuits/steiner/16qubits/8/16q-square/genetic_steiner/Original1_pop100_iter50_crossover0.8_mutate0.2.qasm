// Initial wiring: [8, 14, 3, 0, 7, 2, 1, 13, 9, 12, 5, 4, 15, 10, 6, 11]
// Resulting wiring: [8, 14, 3, 0, 7, 2, 1, 13, 9, 12, 5, 4, 15, 10, 6, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[15], q[14];
cx q[7], q[8];
cx q[5], q[6];
cx q[3], q[4];
cx q[1], q[6];
cx q[6], q[9];
cx q[1], q[2];
