// Initial wiring: [3, 14, 10, 7, 6, 1, 5, 11, 0, 13, 8, 15, 4, 9, 2, 12]
// Resulting wiring: [3, 14, 10, 7, 6, 1, 5, 11, 0, 13, 8, 15, 4, 9, 2, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[12], q[11];
cx q[5], q[6];
