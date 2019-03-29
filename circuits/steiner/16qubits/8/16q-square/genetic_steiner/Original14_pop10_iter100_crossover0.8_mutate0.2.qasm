// Initial wiring: [12, 4, 7, 15, 2, 10, 11, 14, 8, 6, 5, 13, 9, 1, 0, 3]
// Resulting wiring: [12, 4, 7, 15, 2, 10, 11, 14, 8, 6, 5, 13, 9, 1, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[7], q[0];
cx q[9], q[8];
cx q[9], q[6];
cx q[15], q[8];
cx q[8], q[7];
cx q[7], q[0];
cx q[8], q[7];
cx q[4], q[5];
cx q[2], q[5];
