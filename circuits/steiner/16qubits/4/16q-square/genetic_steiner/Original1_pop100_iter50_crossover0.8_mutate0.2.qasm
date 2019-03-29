// Initial wiring: [10, 4, 11, 8, 3, 1, 12, 2, 0, 9, 5, 7, 6, 15, 13, 14]
// Resulting wiring: [10, 4, 11, 8, 3, 1, 12, 2, 0, 9, 5, 7, 6, 15, 13, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[11], q[10];
cx q[11], q[4];
cx q[14], q[15];
