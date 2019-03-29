// Initial wiring: [4, 17, 1, 6, 7, 10, 11, 13, 18, 5, 2, 19, 8, 15, 12, 3, 14, 9, 16, 0]
// Resulting wiring: [4, 17, 1, 6, 7, 10, 11, 13, 18, 5, 2, 19, 8, 15, 12, 3, 14, 9, 16, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[12], q[7];
cx q[16], q[15];
cx q[2], q[3];
