// Initial wiring: [0, 15, 6, 5, 1, 14, 13, 8, 11, 4, 12, 3, 2, 9, 7, 10]
// Resulting wiring: [0, 15, 6, 5, 1, 14, 13, 8, 11, 4, 12, 3, 2, 9, 7, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[8], q[9];
cx q[6], q[9];
cx q[5], q[10];
