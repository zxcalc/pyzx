// Initial wiring: [5, 10, 8, 6, 0, 14, 13, 11, 15, 3, 4, 1, 2, 9, 12, 7]
// Resulting wiring: [5, 10, 8, 6, 0, 14, 13, 11, 15, 3, 4, 1, 2, 9, 12, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[11], q[12];
cx q[6], q[9];
cx q[9], q[10];
cx q[9], q[8];
cx q[4], q[11];
cx q[4], q[5];
cx q[1], q[6];
