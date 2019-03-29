// Initial wiring: [4, 5, 3, 14, 15, 1, 11, 10, 12, 8, 6, 13, 9, 7, 2, 0]
// Resulting wiring: [4, 5, 3, 14, 15, 1, 11, 10, 12, 8, 6, 13, 9, 7, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[6];
cx q[11], q[5];
cx q[6], q[9];
cx q[10], q[15];
