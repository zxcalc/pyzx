// Initial wiring: [15, 4, 3, 2, 13, 5, 14, 6, 1, 11, 12, 7, 9, 8, 0, 10]
// Resulting wiring: [15, 4, 3, 2, 13, 5, 14, 6, 1, 11, 12, 7, 9, 8, 0, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[9];
cx q[6], q[9];
cx q[2], q[3];
cx q[0], q[1];
