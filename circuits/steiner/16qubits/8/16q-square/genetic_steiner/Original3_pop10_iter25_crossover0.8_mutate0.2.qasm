// Initial wiring: [3, 1, 11, 10, 5, 2, 8, 4, 0, 13, 6, 12, 15, 9, 14, 7]
// Resulting wiring: [3, 1, 11, 10, 5, 2, 8, 4, 0, 13, 6, 12, 15, 9, 14, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[4];
cx q[6], q[5];
cx q[11], q[12];
cx q[7], q[8];
cx q[8], q[9];
cx q[2], q[5];
cx q[0], q[7];
