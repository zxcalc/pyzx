// Initial wiring: [0, 4, 13, 1, 8, 2, 15, 6, 14, 9, 5, 7, 10, 12, 3, 11]
// Resulting wiring: [0, 4, 13, 1, 8, 2, 15, 6, 14, 9, 5, 7, 10, 12, 3, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[6], q[1];
cx q[15], q[8];
