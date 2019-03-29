// Initial wiring: [5, 4, 11, 15, 3, 9, 13, 14, 12, 0, 8, 2, 1, 10, 7, 6]
// Resulting wiring: [5, 4, 11, 15, 3, 9, 13, 14, 12, 0, 8, 2, 1, 10, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[1];
cx q[11], q[4];
cx q[7], q[8];
