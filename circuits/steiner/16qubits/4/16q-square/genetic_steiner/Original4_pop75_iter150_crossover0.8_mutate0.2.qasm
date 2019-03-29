// Initial wiring: [10, 9, 5, 13, 3, 6, 12, 4, 1, 8, 2, 0, 15, 14, 11, 7]
// Resulting wiring: [10, 9, 5, 13, 3, 6, 12, 4, 1, 8, 2, 0, 15, 14, 11, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[15];
cx q[12], q[13];
cx q[3], q[4];
cx q[1], q[2];
