// Initial wiring: [2, 5, 13, 14, 9, 10, 1, 15, 0, 8, 3, 4, 7, 12, 11, 6]
// Resulting wiring: [2, 5, 13, 14, 9, 10, 1, 15, 0, 8, 3, 4, 7, 12, 11, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[10], q[13];
cx q[2], q[5];
cx q[1], q[2];
