// Initial wiring: [5, 2, 0, 11, 8, 1, 13, 10, 3, 7, 9, 4, 6, 14, 15, 12]
// Resulting wiring: [5, 2, 0, 11, 8, 1, 13, 10, 3, 7, 9, 4, 6, 14, 15, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[5], q[6];
cx q[4], q[11];
cx q[4], q[5];
