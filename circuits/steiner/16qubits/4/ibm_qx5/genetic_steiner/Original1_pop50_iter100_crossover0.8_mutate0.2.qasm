// Initial wiring: [10, 15, 3, 7, 13, 14, 4, 11, 0, 6, 8, 1, 5, 12, 2, 9]
// Resulting wiring: [10, 15, 3, 7, 13, 14, 4, 11, 0, 6, 8, 1, 5, 12, 2, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[12], q[11];
cx q[4], q[5];
cx q[3], q[12];
