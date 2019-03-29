// Initial wiring: [7, 3, 0, 12, 6, 5, 11, 2, 14, 10, 8, 4, 13, 9, 1, 15]
// Resulting wiring: [7, 3, 0, 12, 6, 5, 11, 2, 14, 10, 8, 4, 13, 9, 1, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[6], q[9];
cx q[9], q[8];
cx q[5], q[6];
