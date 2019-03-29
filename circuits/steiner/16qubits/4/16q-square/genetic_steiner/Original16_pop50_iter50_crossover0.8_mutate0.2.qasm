// Initial wiring: [1, 2, 14, 8, 4, 3, 15, 10, 7, 9, 5, 11, 13, 12, 0, 6]
// Resulting wiring: [1, 2, 14, 8, 4, 3, 15, 10, 7, 9, 5, 11, 13, 12, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[8], q[15];
cx q[5], q[6];
cx q[0], q[1];
