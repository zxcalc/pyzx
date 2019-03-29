// Initial wiring: [18, 3, 2, 15, 13, 5, 16, 7, 14, 11, 17, 6, 8, 4, 19, 0, 10, 1, 12, 9]
// Resulting wiring: [18, 3, 2, 15, 13, 5, 16, 7, 14, 11, 17, 6, 8, 4, 19, 0, 10, 1, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[10];
cx q[17], q[18];
cx q[13], q[14];
cx q[3], q[4];
