// Initial wiring: [10, 2, 6, 4, 11, 9, 14, 0, 15, 1, 5, 8, 7, 13, 3, 12]
// Resulting wiring: [10, 2, 6, 4, 11, 9, 14, 0, 15, 1, 5, 8, 7, 13, 3, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[8], q[15];
cx q[3], q[4];
cx q[4], q[5];
