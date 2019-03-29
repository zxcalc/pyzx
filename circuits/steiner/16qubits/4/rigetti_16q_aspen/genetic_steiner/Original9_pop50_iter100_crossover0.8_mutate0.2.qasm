// Initial wiring: [3, 15, 4, 0, 7, 12, 6, 13, 11, 5, 9, 14, 1, 10, 8, 2]
// Resulting wiring: [3, 15, 4, 0, 7, 12, 6, 13, 11, 5, 9, 14, 1, 10, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[6];
cx q[8], q[15];
cx q[15], q[14];
