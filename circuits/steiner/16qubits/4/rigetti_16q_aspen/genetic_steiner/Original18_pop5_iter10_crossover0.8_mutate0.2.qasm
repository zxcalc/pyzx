// Initial wiring: [11, 5, 1, 2, 9, 12, 10, 15, 14, 4, 3, 6, 0, 7, 13, 8]
// Resulting wiring: [11, 5, 1, 2, 9, 12, 10, 15, 14, 4, 3, 6, 0, 7, 13, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[15], q[14];
cx q[3], q[4];
