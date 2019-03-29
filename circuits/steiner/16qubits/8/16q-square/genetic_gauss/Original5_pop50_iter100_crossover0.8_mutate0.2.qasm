// Initial wiring: [2, 1, 3, 6, 5, 9, 0, 14, 4, 12, 13, 8, 10, 11, 7, 15]
// Resulting wiring: [2, 1, 3, 6, 5, 9, 0, 14, 4, 12, 13, 8, 10, 11, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[14], q[0];
cx q[12], q[6];
cx q[13], q[11];
cx q[1], q[3];
cx q[0], q[1];
cx q[3], q[10];
cx q[1], q[8];
