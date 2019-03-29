// Initial wiring: [2, 11, 7, 9, 4, 12, 13, 8, 14, 6, 1, 15, 10, 5, 3, 0]
// Resulting wiring: [2, 11, 7, 9, 4, 12, 13, 8, 14, 6, 1, 15, 10, 5, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[2];
cx q[6], q[9];
cx q[0], q[7];
