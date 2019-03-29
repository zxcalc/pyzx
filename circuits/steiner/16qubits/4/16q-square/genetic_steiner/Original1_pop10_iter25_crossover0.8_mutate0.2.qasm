// Initial wiring: [7, 3, 14, 4, 9, 13, 1, 5, 8, 11, 6, 15, 10, 12, 2, 0]
// Resulting wiring: [7, 3, 14, 4, 9, 13, 1, 5, 8, 11, 6, 15, 10, 12, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[6];
cx q[0], q[7];
cx q[0], q[1];
