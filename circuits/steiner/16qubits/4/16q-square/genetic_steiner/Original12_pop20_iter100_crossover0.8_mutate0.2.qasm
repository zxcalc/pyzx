// Initial wiring: [12, 7, 13, 6, 1, 9, 10, 5, 3, 2, 14, 11, 0, 8, 15, 4]
// Resulting wiring: [12, 7, 13, 6, 1, 9, 10, 5, 3, 2, 14, 11, 0, 8, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[15];
cx q[10], q[11];
cx q[8], q[9];
cx q[4], q[11];
