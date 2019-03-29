// Initial wiring: [2, 5, 12, 15, 3, 9, 7, 14, 8, 11, 10, 4, 6, 13, 0, 1]
// Resulting wiring: [2, 5, 12, 15, 3, 9, 7, 14, 8, 11, 10, 4, 6, 13, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[13], q[12];
cx q[12], q[11];
cx q[8], q[9];
