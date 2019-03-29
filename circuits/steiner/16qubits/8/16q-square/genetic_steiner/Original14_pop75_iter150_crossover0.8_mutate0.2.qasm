// Initial wiring: [4, 5, 10, 2, 15, 7, 11, 12, 8, 6, 0, 14, 13, 1, 9, 3]
// Resulting wiring: [4, 5, 10, 2, 15, 7, 11, 12, 8, 6, 0, 14, 13, 1, 9, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[9], q[8];
cx q[9], q[6];
cx q[15], q[8];
cx q[8], q[7];
