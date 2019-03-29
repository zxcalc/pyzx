// Initial wiring: [2, 10, 11, 8, 5, 14, 3, 4, 6, 7, 9, 1, 12, 0, 15, 13]
// Resulting wiring: [2, 10, 11, 8, 5, 14, 3, 4, 6, 7, 9, 1, 12, 0, 15, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[15], q[8];
cx q[8], q[7];
cx q[9], q[10];
