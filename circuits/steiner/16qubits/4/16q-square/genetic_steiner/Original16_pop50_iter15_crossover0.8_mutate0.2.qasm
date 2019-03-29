// Initial wiring: [9, 15, 6, 7, 4, 8, 3, 10, 12, 2, 5, 11, 13, 0, 1, 14]
// Resulting wiring: [9, 15, 6, 7, 4, 8, 3, 10, 12, 2, 5, 11, 13, 0, 1, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[1];
cx q[12], q[11];
cx q[14], q[9];
