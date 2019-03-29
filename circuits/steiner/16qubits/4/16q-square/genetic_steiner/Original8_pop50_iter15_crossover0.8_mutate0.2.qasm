// Initial wiring: [0, 6, 7, 2, 15, 10, 5, 12, 11, 1, 9, 3, 4, 14, 13, 8]
// Resulting wiring: [0, 6, 7, 2, 15, 10, 5, 12, 11, 1, 9, 3, 4, 14, 13, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[8];
cx q[14], q[9];
cx q[9], q[8];
cx q[8], q[15];
