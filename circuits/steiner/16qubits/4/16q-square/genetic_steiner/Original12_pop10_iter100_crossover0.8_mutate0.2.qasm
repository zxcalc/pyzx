// Initial wiring: [6, 12, 0, 15, 4, 10, 9, 1, 11, 8, 3, 7, 13, 2, 5, 14]
// Resulting wiring: [6, 12, 0, 15, 4, 10, 9, 1, 11, 8, 3, 7, 13, 2, 5, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[8];
cx q[10], q[13];
cx q[7], q[8];
cx q[3], q[4];
