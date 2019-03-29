// Initial wiring: [10, 8, 14, 15, 2, 3, 12, 13, 6, 4, 0, 9, 7, 1, 5, 11]
// Resulting wiring: [10, 8, 14, 15, 2, 3, 12, 13, 6, 4, 0, 9, 7, 1, 5, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[9], q[8];
cx q[15], q[0];
cx q[14], q[15];
cx q[8], q[9];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[8];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[1];
