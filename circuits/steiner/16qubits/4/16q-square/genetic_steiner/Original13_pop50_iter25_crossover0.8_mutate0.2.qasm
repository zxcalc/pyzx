// Initial wiring: [14, 12, 5, 8, 4, 13, 15, 3, 2, 6, 9, 11, 0, 10, 7, 1]
// Resulting wiring: [14, 12, 5, 8, 4, 13, 15, 3, 2, 6, 9, 11, 0, 10, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[8], q[7];
cx q[11], q[4];
cx q[0], q[1];
