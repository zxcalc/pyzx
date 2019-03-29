// Initial wiring: [15, 10, 4, 6, 7, 1, 14, 3, 12, 11, 5, 2, 13, 8, 9, 0]
// Resulting wiring: [15, 10, 4, 6, 7, 1, 14, 3, 12, 11, 5, 2, 13, 8, 9, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[1];
cx q[10], q[9];
cx q[12], q[2];
cx q[1], q[6];
