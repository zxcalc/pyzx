// Initial wiring: [1, 4, 14, 10, 11, 5, 0, 12, 8, 7, 6, 9, 3, 2, 13, 15]
// Resulting wiring: [1, 4, 14, 10, 11, 5, 0, 12, 8, 7, 6, 9, 3, 2, 13, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[3], q[2];
cx q[5], q[4];
cx q[14], q[1];
