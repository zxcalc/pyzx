// Initial wiring: [7, 15, 11, 3, 9, 13, 8, 1, 10, 6, 12, 4, 14, 2, 0, 5]
// Resulting wiring: [7, 15, 11, 3, 9, 13, 8, 1, 10, 6, 12, 4, 14, 2, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[8];
cx q[9], q[10];
cx q[2], q[3];
