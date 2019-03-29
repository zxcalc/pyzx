// Initial wiring: [4, 6, 11, 9, 10, 14, 0, 15, 12, 8, 3, 7, 5, 2, 1, 13]
// Resulting wiring: [4, 6, 11, 9, 10, 14, 0, 15, 12, 8, 3, 7, 5, 2, 1, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[3];
cx q[13], q[3];
cx q[7], q[8];
cx q[9], q[15];
