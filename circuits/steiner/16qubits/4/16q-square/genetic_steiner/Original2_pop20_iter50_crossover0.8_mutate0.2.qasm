// Initial wiring: [5, 12, 9, 7, 11, 15, 13, 10, 0, 6, 14, 8, 1, 2, 4, 3]
// Resulting wiring: [5, 12, 9, 7, 11, 15, 13, 10, 0, 6, 14, 8, 1, 2, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[11], q[4];
cx q[6], q[9];
cx q[9], q[14];
