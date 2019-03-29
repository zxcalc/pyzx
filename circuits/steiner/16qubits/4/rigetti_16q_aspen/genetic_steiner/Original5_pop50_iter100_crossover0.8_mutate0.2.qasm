// Initial wiring: [6, 7, 12, 3, 4, 15, 1, 8, 11, 14, 2, 10, 13, 5, 9, 0]
// Resulting wiring: [6, 7, 12, 3, 4, 15, 1, 8, 11, 14, 2, 10, 13, 5, 9, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[8], q[7];
cx q[12], q[11];
cx q[13], q[12];
