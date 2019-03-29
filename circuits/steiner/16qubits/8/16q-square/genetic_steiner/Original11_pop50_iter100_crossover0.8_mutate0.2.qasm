// Initial wiring: [2, 9, 6, 15, 13, 7, 14, 4, 3, 8, 11, 0, 5, 1, 12, 10]
// Resulting wiring: [2, 9, 6, 15, 13, 7, 14, 4, 3, 8, 11, 0, 5, 1, 12, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[6], q[1];
cx q[9], q[8];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[11];
cx q[0], q[1];
