// Initial wiring: [9, 10, 5, 16, 11, 8, 7, 2, 4, 17, 3, 19, 1, 12, 13, 6, 0, 14, 18, 15]
// Resulting wiring: [9, 10, 5, 16, 11, 8, 7, 2, 4, 17, 3, 19, 1, 12, 13, 6, 0, 14, 18, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[10], q[8];
cx q[19], q[18];
cx q[6], q[7];
