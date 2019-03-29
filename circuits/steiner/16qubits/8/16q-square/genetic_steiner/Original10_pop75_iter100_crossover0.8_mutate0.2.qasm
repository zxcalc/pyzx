// Initial wiring: [9, 8, 13, 1, 11, 12, 15, 7, 0, 6, 2, 4, 14, 10, 5, 3]
// Resulting wiring: [9, 8, 13, 1, 11, 12, 15, 7, 0, 6, 2, 4, 14, 10, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[14], q[9];
cx q[9], q[6];
cx q[15], q[8];
cx q[8], q[9];
cx q[7], q[8];
cx q[5], q[10];
cx q[4], q[11];
