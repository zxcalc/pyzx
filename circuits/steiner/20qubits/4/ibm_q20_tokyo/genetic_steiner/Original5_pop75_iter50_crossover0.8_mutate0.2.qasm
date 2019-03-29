// Initial wiring: [5, 14, 13, 19, 17, 10, 8, 12, 4, 11, 1, 18, 0, 6, 7, 16, 2, 9, 15, 3]
// Resulting wiring: [5, 14, 13, 19, 17, 10, 8, 12, 4, 11, 1, 18, 0, 6, 7, 16, 2, 9, 15, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[9];
cx q[5], q[6];
cx q[6], q[7];
cx q[4], q[6];
