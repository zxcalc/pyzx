// Initial wiring: [5, 1, 4, 15, 7, 3, 14, 11, 2, 10, 9, 12, 6, 13, 8, 0]
// Resulting wiring: [5, 1, 4, 15, 7, 3, 14, 11, 2, 10, 9, 12, 6, 13, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[6];
cx q[6], q[5];
cx q[2], q[3];
