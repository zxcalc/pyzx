// Initial wiring: [14, 4, 10, 11, 15, 7, 13, 9, 3, 1, 0, 2, 6, 5, 12, 8]
// Resulting wiring: [14, 4, 10, 11, 15, 7, 13, 9, 3, 1, 0, 2, 6, 5, 12, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[9];
cx q[1], q[3];
cx q[4], q[14];
cx q[3], q[7];
