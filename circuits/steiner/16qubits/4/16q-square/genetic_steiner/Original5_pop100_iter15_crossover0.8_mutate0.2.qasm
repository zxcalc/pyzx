// Initial wiring: [4, 5, 13, 10, 14, 2, 3, 9, 6, 12, 15, 7, 8, 11, 1, 0]
// Resulting wiring: [4, 5, 13, 10, 14, 2, 3, 9, 6, 12, 15, 7, 8, 11, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[6], q[9];
cx q[2], q[3];
cx q[1], q[2];
