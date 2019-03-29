// Initial wiring: [10, 4, 14, 9, 1, 13, 7, 15, 0, 6, 8, 11, 5, 2, 3, 12]
// Resulting wiring: [10, 4, 14, 9, 1, 13, 7, 15, 0, 6, 8, 11, 5, 2, 3, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[9], q[8];
cx q[11], q[10];
cx q[10], q[11];
cx q[5], q[10];
cx q[10], q[11];
