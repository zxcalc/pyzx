// Initial wiring: [9, 10, 7, 18, 13, 4, 11, 15, 17, 2, 0, 6, 19, 5, 16, 3, 8, 14, 1, 12]
// Resulting wiring: [9, 10, 7, 18, 13, 4, 11, 15, 17, 2, 0, 6, 19, 5, 16, 3, 8, 14, 1, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[15], q[16];
cx q[8], q[10];
cx q[7], q[8];
