// Initial wiring: [15, 2, 1, 5, 7, 8, 9, 12, 14, 3, 13, 6, 4, 11, 10, 0]
// Resulting wiring: [15, 2, 1, 5, 7, 8, 9, 12, 14, 3, 13, 6, 4, 11, 10, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[5], q[10];
cx q[1], q[6];
cx q[0], q[7];
