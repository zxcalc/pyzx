// Initial wiring: [5, 1, 15, 4, 7, 2, 6, 8, 9, 12, 11, 13, 10, 14, 3, 0]
// Resulting wiring: [5, 1, 15, 4, 7, 2, 6, 8, 9, 12, 11, 13, 10, 14, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[12], q[13];
cx q[13], q[14];
