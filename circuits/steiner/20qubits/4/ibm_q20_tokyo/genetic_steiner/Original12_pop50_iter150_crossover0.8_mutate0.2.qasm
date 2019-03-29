// Initial wiring: [5, 1, 17, 6, 7, 12, 4, 8, 15, 16, 2, 3, 11, 13, 19, 14, 0, 10, 9, 18]
// Resulting wiring: [5, 1, 17, 6, 7, 12, 4, 8, 15, 16, 2, 3, 11, 13, 19, 14, 0, 10, 9, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[4], q[3];
cx q[19], q[18];
cx q[12], q[18];
