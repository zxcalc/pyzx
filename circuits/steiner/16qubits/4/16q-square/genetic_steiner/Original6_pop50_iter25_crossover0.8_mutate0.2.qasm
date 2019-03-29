// Initial wiring: [14, 10, 8, 2, 15, 5, 11, 1, 7, 0, 12, 3, 6, 13, 4, 9]
// Resulting wiring: [14, 10, 8, 2, 15, 5, 11, 1, 7, 0, 12, 3, 6, 13, 4, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[1], q[0];
cx q[13], q[14];
cx q[5], q[6];
