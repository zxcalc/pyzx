// Initial wiring: [13, 10, 2, 12, 5, 9, 8, 11, 7, 4, 0, 1, 6, 14, 15, 3]
// Resulting wiring: [13, 10, 2, 12, 5, 9, 8, 11, 7, 4, 0, 1, 6, 14, 15, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[14], q[13];
cx q[7], q[8];
cx q[0], q[15];
