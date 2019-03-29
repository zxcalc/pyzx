// Initial wiring: [10, 6, 14, 15, 12, 13, 9, 5, 11, 7, 3, 8, 0, 4, 1, 2]
// Resulting wiring: [10, 6, 14, 15, 12, 13, 9, 5, 11, 7, 3, 8, 0, 4, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[8], q[9];
cx q[6], q[7];
cx q[5], q[10];
