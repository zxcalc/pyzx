// Initial wiring: [13, 1, 14, 4, 6, 12, 0, 7, 15, 3, 11, 10, 5, 2, 8, 9]
// Resulting wiring: [13, 1, 14, 4, 6, 12, 0, 7, 15, 3, 11, 10, 5, 2, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[9];
cx q[4], q[11];
cx q[4], q[5];
