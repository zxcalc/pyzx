// Initial wiring: [3, 14, 9, 0, 6, 10, 1, 7, 5, 13, 11, 8, 12, 15, 4, 2]
// Resulting wiring: [3, 14, 9, 0, 6, 10, 1, 7, 5, 13, 11, 8, 12, 15, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[9], q[6];
cx q[9], q[10];
cx q[10], q[11];
