// Initial wiring: [10, 4, 15, 9, 13, 14, 11, 1, 12, 3, 5, 7, 0, 8, 2, 6]
// Resulting wiring: [10, 4, 15, 9, 13, 14, 11, 1, 12, 3, 5, 7, 0, 8, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[6];
cx q[9], q[14];
cx q[5], q[6];
