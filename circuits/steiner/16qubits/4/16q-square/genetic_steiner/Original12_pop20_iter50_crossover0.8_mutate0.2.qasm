// Initial wiring: [8, 9, 13, 4, 15, 12, 5, 6, 14, 11, 2, 3, 10, 7, 1, 0]
// Resulting wiring: [8, 9, 13, 4, 15, 12, 5, 6, 14, 11, 2, 3, 10, 7, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[11], q[10];
cx q[14], q[9];
cx q[8], q[9];
