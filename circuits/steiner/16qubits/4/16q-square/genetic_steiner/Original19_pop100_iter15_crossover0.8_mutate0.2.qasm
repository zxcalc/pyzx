// Initial wiring: [14, 11, 3, 13, 4, 15, 12, 10, 0, 1, 7, 2, 5, 8, 6, 9]
// Resulting wiring: [14, 11, 3, 13, 4, 15, 12, 10, 0, 1, 7, 2, 5, 8, 6, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[4];
cx q[11], q[4];
cx q[3], q[4];
