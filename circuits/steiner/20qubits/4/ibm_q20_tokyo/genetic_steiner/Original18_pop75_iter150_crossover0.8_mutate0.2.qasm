// Initial wiring: [13, 1, 12, 7, 2, 3, 16, 15, 6, 8, 11, 17, 9, 18, 4, 5, 10, 0, 14, 19]
// Resulting wiring: [13, 1, 12, 7, 2, 3, 16, 15, 6, 8, 11, 17, 9, 18, 4, 5, 10, 0, 14, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[10];
cx q[7], q[13];
cx q[5], q[14];
cx q[3], q[4];
