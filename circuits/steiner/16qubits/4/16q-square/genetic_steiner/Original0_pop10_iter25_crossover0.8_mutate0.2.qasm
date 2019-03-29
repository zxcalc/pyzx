// Initial wiring: [14, 10, 8, 4, 15, 5, 0, 3, 9, 7, 1, 13, 12, 2, 6, 11]
// Resulting wiring: [14, 10, 8, 4, 15, 5, 0, 3, 9, 7, 1, 13, 12, 2, 6, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[10], q[5];
cx q[3], q[4];
cx q[0], q[7];
