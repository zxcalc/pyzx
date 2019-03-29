// Initial wiring: [9, 8, 7, 1, 4, 15, 12, 6, 10, 14, 11, 0, 13, 3, 2, 5]
// Resulting wiring: [9, 8, 7, 1, 4, 15, 12, 6, 10, 14, 11, 0, 13, 3, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[6];
cx q[10], q[13];
cx q[7], q[8];
