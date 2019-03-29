// Initial wiring: [10, 12, 3, 0, 5, 8, 15, 9, 2, 14, 6, 11, 1, 4, 13, 7]
// Resulting wiring: [10, 12, 3, 0, 5, 8, 15, 9, 2, 14, 6, 11, 1, 4, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[11], q[4];
cx q[14], q[15];
cx q[0], q[1];
