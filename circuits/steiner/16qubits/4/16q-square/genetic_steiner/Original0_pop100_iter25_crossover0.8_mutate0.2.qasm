// Initial wiring: [5, 1, 12, 3, 14, 13, 9, 0, 4, 15, 6, 10, 7, 8, 2, 11]
// Resulting wiring: [5, 1, 12, 3, 14, 13, 9, 0, 4, 15, 6, 10, 7, 8, 2, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[11], q[4];
cx q[4], q[3];
cx q[8], q[9];
