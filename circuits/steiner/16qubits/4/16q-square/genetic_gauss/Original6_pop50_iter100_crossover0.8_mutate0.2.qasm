// Initial wiring: [12, 13, 9, 5, 3, 2, 8, 7, 10, 14, 15, 0, 1, 4, 11, 6]
// Resulting wiring: [12, 13, 9, 5, 3, 2, 8, 7, 10, 14, 15, 0, 1, 4, 11, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[8];
cx q[8], q[9];
cx q[3], q[14];
cx q[1], q[13];
