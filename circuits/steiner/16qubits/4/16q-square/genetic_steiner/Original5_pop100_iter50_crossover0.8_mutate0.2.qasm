// Initial wiring: [15, 8, 11, 4, 14, 9, 2, 0, 3, 12, 7, 10, 13, 5, 1, 6]
// Resulting wiring: [15, 8, 11, 4, 14, 9, 2, 0, 3, 12, 7, 10, 13, 5, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[12], q[11];
cx q[13], q[12];
cx q[8], q[9];
