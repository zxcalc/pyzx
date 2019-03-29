// Initial wiring: [10, 12, 1, 3, 14, 17, 16, 0, 18, 9, 8, 15, 5, 7, 13, 19, 6, 11, 4, 2]
// Resulting wiring: [10, 12, 1, 3, 14, 17, 16, 0, 18, 9, 8, 15, 5, 7, 13, 19, 6, 11, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[8], q[1];
cx q[13], q[7];
cx q[17], q[16];
cx q[8], q[10];
cx q[5], q[14];
