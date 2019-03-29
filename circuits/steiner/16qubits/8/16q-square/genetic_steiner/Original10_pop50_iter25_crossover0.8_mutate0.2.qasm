// Initial wiring: [4, 14, 1, 13, 15, 5, 6, 11, 9, 12, 2, 8, 10, 7, 0, 3]
// Resulting wiring: [4, 14, 1, 13, 15, 5, 6, 11, 9, 12, 2, 8, 10, 7, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[0];
cx q[9], q[6];
cx q[15], q[14];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[13], q[14];
cx q[9], q[10];
cx q[5], q[6];
