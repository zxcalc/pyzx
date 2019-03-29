// Initial wiring: [13, 0, 8, 12, 10, 9, 14, 3, 2, 11, 5, 4, 15, 6, 1, 7]
// Resulting wiring: [13, 0, 8, 12, 10, 9, 14, 3, 2, 11, 5, 4, 15, 6, 1, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[14], q[9];
cx q[7], q[8];
cx q[6], q[9];
