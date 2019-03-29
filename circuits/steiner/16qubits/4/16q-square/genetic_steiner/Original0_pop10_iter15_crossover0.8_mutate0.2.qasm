// Initial wiring: [6, 9, 4, 13, 0, 15, 2, 12, 8, 10, 14, 3, 7, 11, 5, 1]
// Resulting wiring: [6, 9, 4, 13, 0, 15, 2, 12, 8, 10, 14, 3, 7, 11, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[14];
cx q[9], q[10];
cx q[10], q[11];
cx q[2], q[5];
