// Initial wiring: [2, 15, 3, 7, 5, 10, 4, 6, 14, 8, 11, 0, 12, 1, 13, 9]
// Resulting wiring: [2, 15, 3, 7, 5, 10, 4, 6, 14, 8, 11, 0, 12, 1, 13, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[15], q[13];
cx q[13], q[14];
cx q[9], q[13];
