// Initial wiring: [15, 14, 10, 6, 13, 4, 0, 1, 2, 8, 5, 9, 3, 7, 12, 11]
// Resulting wiring: [15, 14, 10, 6, 13, 4, 0, 1, 2, 8, 5, 9, 3, 7, 12, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[14], q[13];
cx q[15], q[8];
cx q[8], q[9];
