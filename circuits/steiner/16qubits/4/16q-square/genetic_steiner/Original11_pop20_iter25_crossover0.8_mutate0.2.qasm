// Initial wiring: [4, 1, 15, 6, 2, 10, 13, 11, 5, 7, 12, 3, 0, 14, 9, 8]
// Resulting wiring: [4, 1, 15, 6, 2, 10, 13, 11, 5, 7, 12, 3, 0, 14, 9, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[7], q[8];
cx q[6], q[9];
cx q[5], q[10];
