// Initial wiring: [5, 1, 7, 2, 12, 13, 9, 6, 3, 14, 10, 11, 8, 0, 15, 4]
// Resulting wiring: [5, 1, 7, 2, 12, 13, 9, 6, 3, 14, 10, 11, 8, 0, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[10], q[9];
cx q[9], q[8];
cx q[15], q[14];
