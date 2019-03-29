// Initial wiring: [9, 12, 5, 10, 15, 8, 11, 4, 14, 13, 6, 0, 7, 3, 1, 2]
// Resulting wiring: [9, 12, 5, 10, 15, 8, 11, 4, 14, 13, 6, 0, 7, 3, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[10], q[11];
cx q[9], q[14];
