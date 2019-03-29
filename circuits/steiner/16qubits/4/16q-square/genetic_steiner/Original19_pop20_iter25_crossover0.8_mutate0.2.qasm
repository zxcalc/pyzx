// Initial wiring: [8, 5, 4, 13, 9, 15, 2, 10, 6, 14, 0, 3, 12, 1, 11, 7]
// Resulting wiring: [8, 5, 4, 13, 9, 15, 2, 10, 6, 14, 0, 3, 12, 1, 11, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[14], q[9];
