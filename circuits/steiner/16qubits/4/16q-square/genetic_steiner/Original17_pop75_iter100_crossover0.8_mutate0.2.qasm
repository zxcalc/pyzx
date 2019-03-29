// Initial wiring: [1, 3, 0, 15, 6, 5, 14, 4, 2, 11, 9, 12, 10, 13, 8, 7]
// Resulting wiring: [1, 3, 0, 15, 6, 5, 14, 4, 2, 11, 9, 12, 10, 13, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[1];
cx q[7], q[0];
cx q[9], q[10];
