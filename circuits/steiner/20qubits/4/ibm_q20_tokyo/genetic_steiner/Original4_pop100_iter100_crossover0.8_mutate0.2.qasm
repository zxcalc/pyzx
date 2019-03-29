// Initial wiring: [12, 13, 14, 1, 15, 19, 2, 5, 16, 17, 10, 0, 3, 11, 4, 6, 7, 8, 9, 18]
// Resulting wiring: [12, 13, 14, 1, 15, 19, 2, 5, 16, 17, 10, 0, 3, 11, 4, 6, 7, 8, 9, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[7], q[6];
cx q[8], q[11];
cx q[8], q[10];
