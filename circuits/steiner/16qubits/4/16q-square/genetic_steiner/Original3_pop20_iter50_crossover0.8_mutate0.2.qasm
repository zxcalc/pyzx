// Initial wiring: [3, 5, 0, 6, 8, 12, 7, 11, 15, 2, 9, 13, 1, 14, 10, 4]
// Resulting wiring: [3, 5, 0, 6, 8, 12, 7, 11, 15, 2, 9, 13, 1, 14, 10, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[13];
cx q[8], q[9];
cx q[4], q[5];
cx q[1], q[6];
