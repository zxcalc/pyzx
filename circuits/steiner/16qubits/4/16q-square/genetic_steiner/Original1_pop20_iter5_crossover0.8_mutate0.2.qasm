// Initial wiring: [8, 14, 13, 12, 11, 9, 4, 15, 6, 1, 10, 2, 7, 3, 5, 0]
// Resulting wiring: [8, 14, 13, 12, 11, 9, 4, 15, 6, 1, 10, 2, 7, 3, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[14], q[9];
cx q[13], q[14];
cx q[12], q[13];
cx q[13], q[14];
