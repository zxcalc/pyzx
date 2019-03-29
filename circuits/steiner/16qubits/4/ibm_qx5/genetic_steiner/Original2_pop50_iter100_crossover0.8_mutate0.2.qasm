// Initial wiring: [11, 10, 4, 6, 7, 9, 0, 12, 1, 14, 2, 3, 13, 5, 15, 8]
// Resulting wiring: [11, 10, 4, 6, 7, 9, 0, 12, 1, 14, 2, 3, 13, 5, 15, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[3];
cx q[3], q[2];
cx q[15], q[0];
cx q[4], q[5];
