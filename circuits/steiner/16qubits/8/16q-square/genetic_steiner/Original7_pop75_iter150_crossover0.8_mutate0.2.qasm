// Initial wiring: [2, 11, 1, 9, 13, 7, 3, 5, 4, 6, 10, 15, 12, 14, 8, 0]
// Resulting wiring: [2, 11, 1, 9, 13, 7, 3, 5, 4, 6, 10, 15, 12, 14, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[10], q[5];
cx q[14], q[15];
cx q[8], q[9];
cx q[4], q[5];
cx q[0], q[1];
cx q[1], q[6];
cx q[6], q[5];
