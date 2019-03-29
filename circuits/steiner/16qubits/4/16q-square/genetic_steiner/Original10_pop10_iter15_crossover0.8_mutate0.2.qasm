// Initial wiring: [3, 0, 6, 11, 8, 4, 2, 5, 7, 10, 13, 1, 9, 15, 14, 12]
// Resulting wiring: [3, 0, 6, 11, 8, 4, 2, 5, 7, 10, 13, 1, 9, 15, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[11], q[10];
cx q[4], q[11];
cx q[4], q[5];
