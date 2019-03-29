// Initial wiring: [4, 1, 5, 11, 10, 0, 3, 13, 8, 15, 12, 14, 6, 2, 7, 9]
// Resulting wiring: [4, 1, 5, 11, 10, 0, 3, 13, 8, 15, 12, 14, 6, 2, 7, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[3], q[4];
cx q[4], q[11];
cx q[2], q[3];
