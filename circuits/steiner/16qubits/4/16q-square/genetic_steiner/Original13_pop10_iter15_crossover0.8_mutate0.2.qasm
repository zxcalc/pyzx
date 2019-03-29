// Initial wiring: [14, 11, 5, 9, 6, 10, 4, 12, 2, 13, 8, 0, 1, 7, 15, 3]
// Resulting wiring: [14, 11, 5, 9, 6, 10, 4, 12, 2, 13, 8, 0, 1, 7, 15, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[8], q[15];
cx q[1], q[6];
cx q[0], q[7];
