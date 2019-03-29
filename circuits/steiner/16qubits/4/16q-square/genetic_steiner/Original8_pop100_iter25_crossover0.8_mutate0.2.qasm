// Initial wiring: [15, 1, 7, 9, 8, 11, 13, 4, 2, 5, 3, 10, 14, 12, 0, 6]
// Resulting wiring: [15, 1, 7, 9, 8, 11, 13, 4, 2, 5, 3, 10, 14, 12, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[15], q[14];
