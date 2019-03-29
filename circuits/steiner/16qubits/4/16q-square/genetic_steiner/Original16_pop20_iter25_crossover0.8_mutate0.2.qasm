// Initial wiring: [4, 11, 3, 8, 6, 15, 13, 9, 0, 2, 5, 7, 14, 12, 1, 10]
// Resulting wiring: [4, 11, 3, 8, 6, 15, 13, 9, 0, 2, 5, 7, 14, 12, 1, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[11], q[4];
cx q[14], q[9];
cx q[2], q[5];
