// Initial wiring: [4, 9, 2, 3, 6, 0, 10, 1, 7, 12, 14, 11, 15, 8, 13, 5]
// Resulting wiring: [4, 9, 2, 3, 6, 0, 10, 1, 7, 12, 14, 11, 15, 8, 13, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[3];
cx q[14], q[8];
cx q[6], q[9];
cx q[11], q[15];
