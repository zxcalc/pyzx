// Initial wiring: [1, 15, 12, 0, 11, 7, 6, 14, 5, 13, 4, 10, 2, 3, 9, 8]
// Resulting wiring: [1, 15, 12, 0, 11, 7, 6, 14, 5, 13, 4, 10, 2, 3, 9, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[9];
cx q[12], q[14];
cx q[2], q[14];
cx q[1], q[2];
