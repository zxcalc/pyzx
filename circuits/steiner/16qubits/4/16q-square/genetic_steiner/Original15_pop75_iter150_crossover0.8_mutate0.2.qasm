// Initial wiring: [15, 3, 9, 7, 10, 2, 6, 5, 12, 14, 13, 8, 0, 11, 1, 4]
// Resulting wiring: [15, 3, 9, 7, 10, 2, 6, 5, 12, 14, 13, 8, 0, 11, 1, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[8], q[15];
cx q[6], q[7];
cx q[5], q[10];
