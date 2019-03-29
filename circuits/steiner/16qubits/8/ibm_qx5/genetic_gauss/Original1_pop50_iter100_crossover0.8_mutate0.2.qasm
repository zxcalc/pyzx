// Initial wiring: [11, 7, 0, 5, 6, 1, 12, 14, 4, 8, 13, 15, 9, 10, 2, 3]
// Resulting wiring: [11, 7, 0, 5, 6, 1, 12, 14, 4, 8, 13, 15, 9, 10, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[5];
cx q[14], q[5];
cx q[10], q[12];
cx q[6], q[12];
cx q[7], q[15];
cx q[0], q[4];
cx q[5], q[6];
