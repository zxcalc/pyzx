// Initial wiring: [3, 7, 5, 15, 6, 0, 12, 4, 11, 13, 10, 2, 14, 9, 1, 8]
// Resulting wiring: [3, 7, 5, 15, 6, 0, 12, 4, 11, 13, 10, 2, 14, 9, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[9], q[14];
cx q[8], q[15];
cx q[4], q[5];
