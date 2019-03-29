// Initial wiring: [2, 5, 8, 17, 0, 10, 16, 1, 7, 4, 6, 12, 15, 9, 11, 13, 3, 14, 18, 19]
// Resulting wiring: [2, 5, 8, 17, 0, 10, 16, 1, 7, 4, 6, 12, 15, 9, 11, 13, 3, 14, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[6], q[5];
cx q[6], q[4];
cx q[12], q[7];
