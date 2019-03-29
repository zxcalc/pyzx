// Initial wiring: [5, 7, 13, 10, 8, 1, 4, 6, 11, 9, 14, 12, 0, 3, 15, 2]
// Resulting wiring: [5, 7, 13, 10, 8, 1, 4, 6, 11, 9, 14, 12, 0, 3, 15, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[15];
cx q[5], q[10];
cx q[4], q[11];
cx q[0], q[1];
