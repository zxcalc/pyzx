// Initial wiring: [16, 13, 17, 12, 3, 11, 4, 0, 9, 1, 15, 14, 6, 2, 18, 8, 10, 5, 7, 19]
// Resulting wiring: [16, 13, 17, 12, 3, 11, 4, 0, 9, 1, 15, 14, 6, 2, 18, 8, 10, 5, 7, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[16];
cx q[3], q[11];
cx q[0], q[11];
cx q[1], q[16];
