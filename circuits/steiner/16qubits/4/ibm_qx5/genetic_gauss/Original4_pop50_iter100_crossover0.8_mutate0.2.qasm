// Initial wiring: [4, 14, 12, 11, 1, 15, 2, 7, 9, 8, 6, 3, 10, 0, 13, 5]
// Resulting wiring: [4, 14, 12, 11, 1, 15, 2, 7, 9, 8, 6, 3, 10, 0, 13, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[1];
cx q[14], q[11];
cx q[8], q[15];
cx q[3], q[7];
