// Initial wiring: [5, 6, 8, 4, 1, 2, 13, 7, 9, 14, 10, 12, 15, 0, 3, 11]
// Resulting wiring: [5, 6, 8, 4, 1, 2, 13, 7, 9, 14, 10, 12, 15, 0, 3, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[8];
cx q[13], q[14];
cx q[9], q[14];
cx q[3], q[4];
