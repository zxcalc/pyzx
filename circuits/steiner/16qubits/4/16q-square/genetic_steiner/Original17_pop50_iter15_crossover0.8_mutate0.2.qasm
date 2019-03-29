// Initial wiring: [4, 10, 5, 15, 7, 6, 14, 1, 0, 3, 11, 9, 13, 12, 2, 8]
// Resulting wiring: [4, 10, 5, 15, 7, 6, 14, 1, 0, 3, 11, 9, 13, 12, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[11];
cx q[8], q[9];
cx q[6], q[9];
cx q[0], q[7];
