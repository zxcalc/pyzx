// Initial wiring: [15, 1, 3, 10, 7, 5, 14, 2, 6, 0, 4, 11, 9, 8, 12, 13]
// Resulting wiring: [15, 1, 3, 10, 7, 5, 14, 2, 6, 0, 4, 11, 9, 8, 12, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[13], q[14];
cx q[1], q[6];
cx q[0], q[7];
