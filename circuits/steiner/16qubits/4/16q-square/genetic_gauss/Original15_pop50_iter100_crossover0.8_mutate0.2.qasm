// Initial wiring: [5, 12, 4, 7, 11, 2, 14, 8, 3, 0, 1, 10, 13, 6, 15, 9]
// Resulting wiring: [5, 12, 4, 7, 11, 2, 14, 8, 3, 0, 1, 10, 13, 6, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[13], q[0];
cx q[1], q[2];
cx q[5], q[12];
