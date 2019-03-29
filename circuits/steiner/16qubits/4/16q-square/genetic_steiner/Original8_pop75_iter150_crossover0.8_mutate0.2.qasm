// Initial wiring: [10, 3, 9, 2, 6, 0, 7, 12, 5, 1, 8, 14, 4, 11, 13, 15]
// Resulting wiring: [10, 3, 9, 2, 6, 0, 7, 12, 5, 1, 8, 14, 4, 11, 13, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[13], q[10];
cx q[14], q[9];
cx q[4], q[5];
