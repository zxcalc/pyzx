// Initial wiring: [6, 5, 3, 10, 12, 2, 4, 13, 0, 15, 1, 14, 11, 7, 8, 9]
// Resulting wiring: [6, 5, 3, 10, 12, 2, 4, 13, 0, 15, 1, 14, 11, 7, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[9], q[6];
cx q[12], q[11];
cx q[5], q[6];
