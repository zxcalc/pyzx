// Initial wiring: [9, 13, 6, 8, 0, 7, 3, 2, 12, 1, 11, 5, 10, 14, 4, 15]
// Resulting wiring: [9, 13, 6, 8, 0, 7, 3, 2, 12, 1, 11, 5, 10, 14, 4, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[15], q[14];
cx q[9], q[10];
cx q[6], q[7];
