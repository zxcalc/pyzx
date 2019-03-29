// Initial wiring: [4, 13, 6, 8, 2, 12, 3, 5, 9, 15, 14, 1, 10, 0, 7, 11]
// Resulting wiring: [4, 13, 6, 8, 2, 12, 3, 5, 9, 15, 14, 1, 10, 0, 7, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[15], q[14];
cx q[9], q[10];
cx q[1], q[6];
