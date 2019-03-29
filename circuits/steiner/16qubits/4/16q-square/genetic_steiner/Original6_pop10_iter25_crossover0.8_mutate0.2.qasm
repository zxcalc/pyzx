// Initial wiring: [4, 13, 1, 5, 10, 3, 12, 15, 7, 0, 14, 11, 6, 9, 2, 8]
// Resulting wiring: [4, 13, 1, 5, 10, 3, 12, 15, 7, 0, 14, 11, 6, 9, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[11];
cx q[11], q[10];
cx q[3], q[4];
cx q[4], q[11];
cx q[11], q[4];
