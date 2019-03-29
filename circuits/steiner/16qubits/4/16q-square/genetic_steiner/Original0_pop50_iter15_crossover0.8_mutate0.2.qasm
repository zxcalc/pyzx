// Initial wiring: [4, 5, 13, 6, 8, 9, 1, 15, 11, 7, 12, 0, 2, 10, 14, 3]
// Resulting wiring: [4, 5, 13, 6, 8, 9, 1, 15, 11, 7, 12, 0, 2, 10, 14, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[13], q[14];
cx q[14], q[15];
cx q[0], q[7];
