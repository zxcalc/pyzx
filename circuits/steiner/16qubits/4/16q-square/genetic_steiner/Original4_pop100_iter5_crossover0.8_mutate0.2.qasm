// Initial wiring: [9, 12, 1, 6, 0, 11, 8, 5, 10, 4, 7, 2, 13, 3, 14, 15]
// Resulting wiring: [9, 12, 1, 6, 0, 11, 8, 5, 10, 4, 7, 2, 13, 3, 14, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[14];
cx q[12], q[13];
cx q[5], q[10];
cx q[0], q[7];
