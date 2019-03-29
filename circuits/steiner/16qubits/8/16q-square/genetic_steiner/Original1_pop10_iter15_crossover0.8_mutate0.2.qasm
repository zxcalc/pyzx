// Initial wiring: [3, 2, 8, 13, 9, 10, 12, 1, 14, 11, 6, 15, 4, 5, 0, 7]
// Resulting wiring: [3, 2, 8, 13, 9, 10, 12, 1, 14, 11, 6, 15, 4, 5, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[0];
cx q[8], q[7];
cx q[7], q[6];
cx q[7], q[0];
cx q[14], q[15];
cx q[9], q[10];
cx q[6], q[7];
cx q[3], q[4];
cx q[1], q[6];
cx q[6], q[7];
