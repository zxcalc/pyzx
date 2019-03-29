// Initial wiring: [13, 2, 3, 7, 5, 1, 9, 14, 6, 15, 8, 4, 12, 11, 0, 10]
// Resulting wiring: [13, 2, 3, 7, 5, 1, 9, 14, 6, 15, 8, 4, 12, 11, 0, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[5];
cx q[3], q[4];
cx q[0], q[7];
