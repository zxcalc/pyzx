// Initial wiring: [10, 6, 0, 1, 3, 5, 7, 11, 2, 9, 12, 15, 4, 14, 8, 13]
// Resulting wiring: [10, 6, 0, 1, 3, 5, 7, 11, 2, 9, 12, 15, 4, 14, 8, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[11], q[10];
cx q[14], q[15];
cx q[8], q[9];
