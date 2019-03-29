// Initial wiring: [9, 8, 12, 6, 0, 2, 14, 10, 11, 7, 13, 4, 15, 1, 3, 5]
// Resulting wiring: [9, 8, 12, 6, 0, 2, 14, 10, 11, 7, 13, 4, 15, 1, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[6];
cx q[15], q[8];
cx q[10], q[11];
