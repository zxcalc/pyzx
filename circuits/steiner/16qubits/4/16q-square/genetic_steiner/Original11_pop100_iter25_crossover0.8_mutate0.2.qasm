// Initial wiring: [1, 9, 3, 0, 11, 2, 12, 10, 6, 4, 15, 5, 8, 14, 13, 7]
// Resulting wiring: [1, 9, 3, 0, 11, 2, 12, 10, 6, 4, 15, 5, 8, 14, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[6];
cx q[14], q[15];
cx q[4], q[11];
