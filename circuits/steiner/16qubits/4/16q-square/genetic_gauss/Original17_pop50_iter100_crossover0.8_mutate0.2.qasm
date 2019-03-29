// Initial wiring: [12, 4, 5, 9, 14, 2, 0, 11, 10, 1, 13, 8, 3, 7, 6, 15]
// Resulting wiring: [12, 4, 5, 9, 14, 2, 0, 11, 10, 1, 13, 8, 3, 7, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[3];
cx q[6], q[12];
cx q[4], q[12];
cx q[1], q[9];
