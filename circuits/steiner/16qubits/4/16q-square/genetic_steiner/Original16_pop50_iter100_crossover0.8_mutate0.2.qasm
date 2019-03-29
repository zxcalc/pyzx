// Initial wiring: [15, 0, 4, 1, 2, 9, 5, 3, 6, 7, 14, 8, 12, 13, 11, 10]
// Resulting wiring: [15, 0, 4, 1, 2, 9, 5, 3, 6, 7, 14, 8, 12, 13, 11, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[9], q[8];
cx q[13], q[14];
cx q[3], q[4];
