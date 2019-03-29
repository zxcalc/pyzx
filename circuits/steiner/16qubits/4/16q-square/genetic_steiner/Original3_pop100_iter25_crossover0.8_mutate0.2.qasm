// Initial wiring: [5, 1, 14, 2, 15, 3, 13, 7, 9, 12, 11, 6, 4, 0, 8, 10]
// Resulting wiring: [5, 1, 14, 2, 15, 3, 13, 7, 9, 12, 11, 6, 4, 0, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[14], q[9];
cx q[1], q[2];
cx q[0], q[7];
