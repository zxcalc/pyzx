// Initial wiring: [10, 5, 11, 2, 8, 9, 4, 3, 6, 1, 14, 0, 15, 12, 7, 13]
// Resulting wiring: [10, 5, 11, 2, 8, 9, 4, 3, 6, 1, 14, 0, 15, 12, 7, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[8];
cx q[13], q[14];
cx q[2], q[3];
cx q[3], q[4];
