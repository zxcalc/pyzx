// Initial wiring: [14, 15, 9, 5, 13, 6, 0, 10, 12, 1, 4, 8, 11, 3, 2, 7]
// Resulting wiring: [14, 15, 9, 5, 13, 6, 0, 10, 12, 1, 4, 8, 11, 3, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[9], q[6];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[9];
cx q[9], q[10];
cx q[2], q[3];
