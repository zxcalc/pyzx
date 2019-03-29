// Initial wiring: [10, 0, 9, 5, 15, 14, 4, 3, 13, 2, 6, 1, 8, 12, 7, 11]
// Resulting wiring: [10, 0, 9, 5, 15, 14, 4, 3, 13, 2, 6, 1, 8, 12, 7, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[15], q[14];
cx q[4], q[5];
cx q[2], q[3];
