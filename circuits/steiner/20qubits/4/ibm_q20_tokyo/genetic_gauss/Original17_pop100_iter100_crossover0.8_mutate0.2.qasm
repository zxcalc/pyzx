// Initial wiring: [1, 9, 14, 17, 16, 0, 5, 4, 11, 3, 15, 2, 7, 12, 10, 8, 18, 13, 6, 19]
// Resulting wiring: [1, 9, 14, 17, 16, 0, 5, 4, 11, 3, 15, 2, 7, 12, 10, 8, 18, 13, 6, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[2], q[5];
cx q[1], q[4];
cx q[3], q[11];
