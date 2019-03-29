// Initial wiring: [10, 2, 5, 6, 8, 4, 7, 0, 14, 15, 9, 1, 13, 11, 12, 3]
// Resulting wiring: [10, 2, 5, 6, 8, 4, 7, 0, 14, 15, 9, 1, 13, 11, 12, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[11];
cx q[11], q[12];
cx q[4], q[11];
cx q[4], q[5];
