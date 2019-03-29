// Initial wiring: [9, 1, 11, 7, 13, 14, 6, 15, 4, 12, 10, 5, 3, 2, 8, 0]
// Resulting wiring: [9, 1, 11, 7, 13, 14, 6, 15, 4, 12, 10, 5, 3, 2, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[12], q[13];
cx q[7], q[8];
cx q[1], q[2];
