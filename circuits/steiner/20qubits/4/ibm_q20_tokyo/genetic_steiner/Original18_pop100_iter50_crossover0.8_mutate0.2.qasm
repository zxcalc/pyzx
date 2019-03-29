// Initial wiring: [3, 18, 11, 10, 2, 7, 1, 8, 15, 4, 14, 19, 12, 16, 17, 5, 6, 0, 9, 13]
// Resulting wiring: [3, 18, 11, 10, 2, 7, 1, 8, 15, 4, 14, 19, 12, 16, 17, 5, 6, 0, 9, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[7], q[2];
cx q[8], q[1];
cx q[0], q[9];
