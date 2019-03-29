// Initial wiring: [0, 10, 14, 5, 1, 3, 15, 6, 7, 13, 8, 2, 9, 12, 11, 4]
// Resulting wiring: [0, 10, 14, 5, 1, 3, 15, 6, 7, 13, 8, 2, 9, 12, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[14];
cx q[5], q[6];
cx q[4], q[11];
