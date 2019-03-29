// Initial wiring: [0, 3, 13, 7, 15, 12, 11, 4, 6, 9, 5, 8, 10, 1, 2, 14]
// Resulting wiring: [0, 3, 13, 7, 15, 12, 11, 4, 6, 9, 5, 8, 10, 1, 2, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[10], q[13];
cx q[6], q[9];
cx q[4], q[5];
