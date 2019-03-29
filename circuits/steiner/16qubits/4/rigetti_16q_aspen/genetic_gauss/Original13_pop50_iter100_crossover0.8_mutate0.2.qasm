// Initial wiring: [0, 3, 15, 5, 2, 12, 7, 1, 4, 13, 9, 11, 6, 8, 10, 14]
// Resulting wiring: [0, 3, 15, 5, 2, 12, 7, 1, 4, 13, 9, 11, 6, 8, 10, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[1];
cx q[9], q[8];
cx q[11], q[8];
cx q[15], q[5];
