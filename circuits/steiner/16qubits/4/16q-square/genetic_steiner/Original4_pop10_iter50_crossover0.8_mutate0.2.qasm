// Initial wiring: [8, 10, 6, 1, 13, 9, 0, 11, 7, 14, 5, 3, 12, 2, 15, 4]
// Resulting wiring: [8, 10, 6, 1, 13, 9, 0, 11, 7, 14, 5, 3, 12, 2, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[7], q[8];
cx q[5], q[10];
cx q[4], q[11];
