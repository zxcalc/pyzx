// Initial wiring: [1, 12, 4, 6, 0, 3, 10, 2, 14, 8, 7, 9, 15, 13, 5, 11]
// Resulting wiring: [1, 12, 4, 6, 0, 3, 10, 2, 14, 8, 7, 9, 15, 13, 5, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[13], q[10];
cx q[15], q[14];
cx q[4], q[5];
