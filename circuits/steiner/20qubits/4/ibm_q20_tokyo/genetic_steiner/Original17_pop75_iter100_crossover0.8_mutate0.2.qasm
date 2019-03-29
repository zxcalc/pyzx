// Initial wiring: [9, 18, 4, 1, 2, 17, 7, 11, 8, 16, 15, 6, 14, 5, 13, 12, 19, 0, 3, 10]
// Resulting wiring: [9, 18, 4, 1, 2, 17, 7, 11, 8, 16, 15, 6, 14, 5, 13, 12, 19, 0, 3, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[7], q[2];
cx q[12], q[17];
cx q[0], q[9];
