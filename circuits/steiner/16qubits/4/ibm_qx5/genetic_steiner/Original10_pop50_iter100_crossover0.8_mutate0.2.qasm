// Initial wiring: [15, 7, 12, 8, 4, 6, 0, 3, 2, 10, 14, 13, 1, 9, 11, 5]
// Resulting wiring: [15, 7, 12, 8, 4, 6, 0, 3, 2, 10, 14, 13, 1, 9, 11, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[12], q[11];
cx q[3], q[12];
cx q[3], q[4];
