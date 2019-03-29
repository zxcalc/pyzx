// Initial wiring: [0, 3, 12, 7, 13, 2, 14, 8, 10, 1, 4, 6, 15, 5, 9, 11]
// Resulting wiring: [0, 3, 12, 7, 13, 2, 14, 8, 10, 1, 4, 6, 15, 5, 9, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[10], q[9];
cx q[15], q[14];
cx q[0], q[1];
