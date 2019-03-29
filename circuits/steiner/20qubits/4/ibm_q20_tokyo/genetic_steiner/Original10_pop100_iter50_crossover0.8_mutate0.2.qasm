// Initial wiring: [16, 19, 18, 14, 15, 11, 2, 1, 4, 5, 10, 6, 7, 0, 13, 12, 8, 17, 9, 3]
// Resulting wiring: [16, 19, 18, 14, 15, 11, 2, 1, 4, 5, 10, 6, 7, 0, 13, 12, 8, 17, 9, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[16], q[15];
cx q[14], q[16];
cx q[8], q[9];
