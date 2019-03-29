// Initial wiring: [5, 4, 3, 14, 6, 0, 1, 13, 11, 9, 7, 15, 10, 8, 2, 12]
// Resulting wiring: [5, 4, 3, 14, 6, 0, 1, 13, 11, 9, 7, 15, 10, 8, 2, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[2];
cx q[8], q[9];
cx q[1], q[6];
