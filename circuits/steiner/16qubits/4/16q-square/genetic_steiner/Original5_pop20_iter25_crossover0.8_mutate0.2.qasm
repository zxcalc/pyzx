// Initial wiring: [14, 2, 10, 7, 6, 13, 5, 3, 12, 8, 9, 1, 15, 0, 11, 4]
// Resulting wiring: [14, 2, 10, 7, 6, 13, 5, 3, 12, 8, 9, 1, 15, 0, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[5];
cx q[14], q[9];
cx q[7], q[8];
