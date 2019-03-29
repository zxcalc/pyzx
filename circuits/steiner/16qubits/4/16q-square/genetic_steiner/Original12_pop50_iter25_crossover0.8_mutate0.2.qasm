// Initial wiring: [9, 6, 0, 12, 4, 1, 11, 14, 10, 13, 7, 15, 3, 2, 8, 5]
// Resulting wiring: [9, 6, 0, 12, 4, 1, 11, 14, 10, 13, 7, 15, 3, 2, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[11], q[4];
cx q[12], q[13];
cx q[5], q[6];
