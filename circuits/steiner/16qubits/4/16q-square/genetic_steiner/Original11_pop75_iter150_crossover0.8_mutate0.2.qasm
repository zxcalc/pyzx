// Initial wiring: [6, 8, 15, 13, 7, 12, 10, 14, 9, 11, 3, 2, 1, 0, 5, 4]
// Resulting wiring: [6, 8, 15, 13, 7, 12, 10, 14, 9, 11, 3, 2, 1, 0, 5, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[13], q[10];
cx q[9], q[14];
cx q[3], q[4];
