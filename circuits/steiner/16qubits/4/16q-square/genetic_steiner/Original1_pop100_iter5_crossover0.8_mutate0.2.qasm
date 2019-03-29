// Initial wiring: [1, 5, 7, 12, 4, 3, 13, 15, 8, 14, 11, 2, 9, 10, 0, 6]
// Resulting wiring: [1, 5, 7, 12, 4, 3, 13, 15, 8, 14, 11, 2, 9, 10, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[6], q[9];
cx q[2], q[5];
