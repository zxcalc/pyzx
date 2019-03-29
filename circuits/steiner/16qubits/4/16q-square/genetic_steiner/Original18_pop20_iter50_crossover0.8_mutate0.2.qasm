// Initial wiring: [0, 4, 10, 7, 13, 3, 6, 5, 2, 9, 1, 8, 14, 15, 12, 11]
// Resulting wiring: [0, 4, 10, 7, 13, 3, 6, 5, 2, 9, 1, 8, 14, 15, 12, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[14], q[9];
cx q[13], q[14];
cx q[8], q[9];
