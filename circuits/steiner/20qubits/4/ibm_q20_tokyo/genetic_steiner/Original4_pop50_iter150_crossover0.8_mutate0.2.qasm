// Initial wiring: [15, 5, 19, 10, 0, 16, 4, 2, 7, 1, 14, 8, 3, 9, 11, 17, 12, 6, 13, 18]
// Resulting wiring: [15, 5, 19, 10, 0, 16, 4, 2, 7, 1, 14, 8, 3, 9, 11, 17, 12, 6, 13, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[5], q[3];
cx q[1], q[7];
cx q[0], q[9];
