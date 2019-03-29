// Initial wiring: [7, 9, 12, 17, 4, 6, 13, 5, 1, 10, 19, 2, 18, 15, 8, 16, 3, 11, 0, 14]
// Resulting wiring: [7, 9, 12, 17, 4, 6, 13, 5, 1, 10, 19, 2, 18, 15, 8, 16, 3, 11, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[0];
cx q[9], q[8];
cx q[7], q[15];
cx q[4], q[10];
