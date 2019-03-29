// Initial wiring: [1, 8, 11, 14, 9, 4, 7, 6, 12, 10, 0, 15, 2, 5, 13, 3]
// Resulting wiring: [1, 8, 11, 14, 9, 4, 7, 6, 12, 10, 0, 15, 2, 5, 13, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[14], q[9];
cx q[15], q[8];
cx q[13], q[14];
