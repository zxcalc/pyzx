// Initial wiring: [12, 0, 5, 4, 7, 9, 18, 6, 2, 10, 14, 15, 11, 8, 16, 17, 1, 19, 3, 13]
// Resulting wiring: [12, 0, 5, 4, 7, 9, 18, 6, 2, 10, 14, 15, 11, 8, 16, 17, 1, 19, 3, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[19], q[18];
cx q[10], q[11];
cx q[8], q[10];
