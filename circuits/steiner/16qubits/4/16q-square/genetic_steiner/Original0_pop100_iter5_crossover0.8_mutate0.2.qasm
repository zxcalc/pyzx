// Initial wiring: [2, 13, 5, 1, 7, 8, 11, 10, 14, 3, 4, 15, 9, 0, 6, 12]
// Resulting wiring: [2, 13, 5, 1, 7, 8, 11, 10, 14, 3, 4, 15, 9, 0, 6, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[10], q[11];
cx q[7], q[8];
cx q[8], q[9];
