// Initial wiring: [10, 12, 14, 6, 5, 9, 3, 0, 8, 4, 1, 11, 2, 13, 15, 7]
// Resulting wiring: [10, 12, 14, 6, 5, 9, 3, 0, 8, 4, 1, 11, 2, 13, 15, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[0];
cx q[9], q[8];
cx q[9], q[6];
cx q[12], q[11];
cx q[10], q[11];
cx q[9], q[14];
cx q[14], q[15];
cx q[6], q[9];
cx q[9], q[14];
cx q[9], q[8];
cx q[9], q[6];
cx q[3], q[4];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[9];
cx q[9], q[14];
cx q[1], q[2];
