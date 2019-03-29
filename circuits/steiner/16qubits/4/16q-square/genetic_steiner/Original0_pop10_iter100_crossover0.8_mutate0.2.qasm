// Initial wiring: [14, 10, 5, 1, 9, 2, 11, 3, 15, 7, 13, 8, 0, 6, 12, 4]
// Resulting wiring: [14, 10, 5, 1, 9, 2, 11, 3, 15, 7, 13, 8, 0, 6, 12, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[15], q[8];
cx q[0], q[7];
