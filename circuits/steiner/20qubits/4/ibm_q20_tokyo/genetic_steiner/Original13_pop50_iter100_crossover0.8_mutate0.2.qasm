// Initial wiring: [10, 8, 2, 5, 9, 11, 12, 17, 13, 18, 3, 7, 0, 15, 16, 19, 4, 1, 6, 14]
// Resulting wiring: [10, 8, 2, 5, 9, 11, 12, 17, 13, 18, 3, 7, 0, 15, 16, 19, 4, 1, 6, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[19], q[10];
cx q[17], q[18];
cx q[1], q[8];
