// Initial wiring: [10, 16, 7, 12, 2, 13, 14, 5, 9, 6, 11, 18, 15, 8, 3, 19, 4, 1, 17, 0]
// Resulting wiring: [10, 16, 7, 12, 2, 13, 14, 5, 9, 6, 11, 18, 15, 8, 3, 19, 4, 1, 17, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[6], q[12];
cx q[5], q[14];
cx q[4], q[6];
