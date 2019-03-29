// Initial wiring: [7, 15, 2, 14, 10, 9, 12, 6, 5, 0, 11, 13, 8, 3, 4, 1]
// Resulting wiring: [7, 15, 2, 14, 10, 9, 12, 6, 5, 0, 11, 13, 8, 3, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[12], q[11];
cx q[2], q[5];
cx q[1], q[6];
