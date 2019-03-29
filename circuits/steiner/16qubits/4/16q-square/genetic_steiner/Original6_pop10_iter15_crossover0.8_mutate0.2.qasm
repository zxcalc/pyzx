// Initial wiring: [10, 11, 5, 0, 8, 1, 12, 14, 7, 13, 2, 6, 3, 9, 4, 15]
// Resulting wiring: [10, 11, 5, 0, 8, 1, 12, 14, 7, 13, 2, 6, 3, 9, 4, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[9], q[14];
cx q[0], q[7];
