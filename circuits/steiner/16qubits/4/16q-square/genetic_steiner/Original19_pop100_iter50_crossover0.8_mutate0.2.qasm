// Initial wiring: [3, 10, 0, 13, 4, 15, 1, 14, 11, 8, 5, 2, 12, 7, 9, 6]
// Resulting wiring: [3, 10, 0, 13, 4, 15, 1, 14, 11, 8, 5, 2, 12, 7, 9, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[8], q[7];
cx q[11], q[4];
cx q[3], q[4];
