// Initial wiring: [1, 4, 3, 10, 8, 7, 15, 12, 14, 5, 6, 0, 2, 13, 17, 9, 11, 16, 19, 18]
// Resulting wiring: [1, 4, 3, 10, 8, 7, 15, 12, 14, 5, 6, 0, 2, 13, 17, 9, 11, 16, 19, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[7], q[6];
cx q[17], q[18];
cx q[3], q[4];
