// Initial wiring: [12, 7, 3, 4, 6, 0, 9, 1, 15, 5, 13, 2, 11, 8, 10, 14]
// Resulting wiring: [12, 7, 3, 4, 6, 0, 9, 1, 15, 5, 13, 2, 11, 8, 10, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[0];
cx q[8], q[1];
cx q[12], q[2];
cx q[4], q[14];
