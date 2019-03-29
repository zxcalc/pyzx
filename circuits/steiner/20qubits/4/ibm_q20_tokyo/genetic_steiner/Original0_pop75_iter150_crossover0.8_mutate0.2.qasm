// Initial wiring: [15, 10, 7, 13, 0, 6, 11, 3, 14, 1, 2, 12, 19, 9, 16, 5, 4, 18, 8, 17]
// Resulting wiring: [15, 10, 7, 13, 0, 6, 11, 3, 14, 1, 2, 12, 19, 9, 16, 5, 4, 18, 8, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[12], q[7];
cx q[16], q[15];
cx q[4], q[5];
