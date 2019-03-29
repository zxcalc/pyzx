// Initial wiring: [12, 13, 0, 4, 1, 3, 14, 2, 9, 5, 6, 7, 10, 15, 8, 11]
// Resulting wiring: [12, 13, 0, 4, 1, 3, 14, 2, 9, 5, 6, 7, 10, 15, 8, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[15], q[8];
cx q[3], q[4];
cx q[2], q[5];
