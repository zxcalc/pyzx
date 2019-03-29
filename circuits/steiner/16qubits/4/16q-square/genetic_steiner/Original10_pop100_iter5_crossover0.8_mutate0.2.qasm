// Initial wiring: [0, 10, 2, 6, 5, 14, 9, 13, 1, 8, 4, 3, 11, 7, 12, 15]
// Resulting wiring: [0, 10, 2, 6, 5, 14, 9, 13, 1, 8, 4, 3, 11, 7, 12, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[8];
cx q[9], q[10];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
