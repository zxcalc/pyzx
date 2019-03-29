// Initial wiring: [9, 2, 3, 5, 1, 6, 0, 13, 4, 8, 14, 10, 15, 7, 12, 11]
// Resulting wiring: [9, 2, 3, 5, 1, 6, 0, 13, 4, 8, 14, 10, 15, 7, 12, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[9];
cx q[7], q[11];
cx q[2], q[14];
cx q[3], q[7];
