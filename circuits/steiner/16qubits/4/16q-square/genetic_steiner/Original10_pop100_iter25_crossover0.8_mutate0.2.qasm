// Initial wiring: [0, 13, 7, 15, 14, 8, 1, 12, 3, 9, 4, 5, 10, 2, 6, 11]
// Resulting wiring: [0, 13, 7, 15, 14, 8, 1, 12, 3, 9, 4, 5, 10, 2, 6, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[1];
cx q[5], q[10];
cx q[5], q[6];
