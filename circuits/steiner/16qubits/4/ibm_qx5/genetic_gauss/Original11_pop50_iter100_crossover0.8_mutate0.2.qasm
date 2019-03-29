// Initial wiring: [15, 13, 3, 4, 5, 12, 9, 1, 11, 6, 14, 0, 7, 10, 8, 2]
// Resulting wiring: [15, 13, 3, 4, 5, 12, 9, 1, 11, 6, 14, 0, 7, 10, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[2];
cx q[8], q[4];
cx q[13], q[5];
cx q[1], q[12];
