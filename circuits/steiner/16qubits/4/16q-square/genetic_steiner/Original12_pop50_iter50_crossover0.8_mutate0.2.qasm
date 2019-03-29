// Initial wiring: [6, 0, 8, 9, 3, 2, 5, 10, 12, 14, 15, 4, 7, 1, 11, 13]
// Resulting wiring: [6, 0, 8, 9, 3, 2, 5, 10, 12, 14, 15, 4, 7, 1, 11, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[14];
cx q[10], q[11];
cx q[9], q[14];
cx q[4], q[5];
