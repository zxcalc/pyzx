// Initial wiring: [12, 8, 15, 14, 10, 11, 5, 4, 13, 3, 2, 9, 6, 1, 0, 7]
// Resulting wiring: [12, 8, 15, 14, 10, 11, 5, 4, 13, 3, 2, 9, 6, 1, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[4], q[3];
cx q[6], q[5];
cx q[8], q[7];
