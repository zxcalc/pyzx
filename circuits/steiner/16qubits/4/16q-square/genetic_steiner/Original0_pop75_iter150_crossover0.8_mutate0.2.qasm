// Initial wiring: [11, 0, 12, 8, 13, 1, 5, 3, 14, 7, 4, 9, 6, 15, 2, 10]
// Resulting wiring: [11, 0, 12, 8, 13, 1, 5, 3, 14, 7, 4, 9, 6, 15, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[8];
cx q[8], q[7];
cx q[10], q[13];
cx q[5], q[6];
