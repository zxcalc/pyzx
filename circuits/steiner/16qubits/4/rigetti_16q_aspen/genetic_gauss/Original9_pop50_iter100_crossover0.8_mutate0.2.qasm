// Initial wiring: [3, 8, 7, 15, 6, 10, 13, 4, 1, 12, 9, 5, 14, 2, 11, 0]
// Resulting wiring: [3, 8, 7, 15, 6, 10, 13, 4, 1, 12, 9, 5, 14, 2, 11, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[2];
cx q[6], q[4];
cx q[14], q[13];
cx q[13], q[1];
