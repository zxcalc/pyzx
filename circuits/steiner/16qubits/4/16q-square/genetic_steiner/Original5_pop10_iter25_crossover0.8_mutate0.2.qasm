// Initial wiring: [0, 9, 12, 3, 4, 14, 15, 7, 1, 10, 13, 8, 11, 5, 2, 6]
// Resulting wiring: [0, 9, 12, 3, 4, 14, 15, 7, 1, 10, 13, 8, 11, 5, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[10], q[9];
cx q[12], q[11];
cx q[13], q[10];
