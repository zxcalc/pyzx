// Initial wiring: [6, 0, 2, 15, 9, 11, 1, 10, 14, 13, 8, 12, 3, 7, 5, 4]
// Resulting wiring: [6, 0, 2, 15, 9, 11, 1, 10, 14, 13, 8, 12, 3, 7, 5, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[10];
cx q[0], q[1];
