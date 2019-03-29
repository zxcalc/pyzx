// Initial wiring: [9, 3, 8, 12, 13, 5, 2, 7, 6, 1, 0, 10, 4, 15, 11, 14]
// Resulting wiring: [9, 3, 8, 12, 13, 5, 2, 7, 6, 1, 0, 10, 4, 15, 11, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[15], q[14];
cx q[9], q[14];
cx q[1], q[6];
