// Initial wiring: [8, 1, 7, 5, 0, 10, 15, 12, 13, 4, 2, 3, 6, 9, 11, 14]
// Resulting wiring: [8, 1, 7, 5, 0, 10, 15, 12, 13, 4, 2, 3, 6, 9, 11, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[14], q[15];
cx q[8], q[9];
cx q[6], q[9];
