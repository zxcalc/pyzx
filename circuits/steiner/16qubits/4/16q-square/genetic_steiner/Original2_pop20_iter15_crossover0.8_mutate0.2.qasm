// Initial wiring: [14, 9, 5, 12, 13, 6, 7, 11, 8, 10, 4, 1, 3, 2, 0, 15]
// Resulting wiring: [14, 9, 5, 12, 13, 6, 7, 11, 8, 10, 4, 1, 3, 2, 0, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[8], q[7];
cx q[4], q[5];
cx q[5], q[10];
