// Initial wiring: [4, 5, 0, 14, 7, 3, 10, 11, 2, 8, 15, 12, 13, 6, 9, 1]
// Resulting wiring: [4, 5, 0, 14, 7, 3, 10, 11, 2, 8, 15, 12, 13, 6, 9, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[12], q[13];
cx q[7], q[8];
cx q[8], q[9];
