// Initial wiring: [15, 17, 18, 12, 19, 1, 0, 10, 9, 4, 11, 2, 5, 8, 3, 14, 6, 13, 16, 7]
// Resulting wiring: [15, 17, 18, 12, 19, 1, 0, 10, 9, 4, 11, 2, 5, 8, 3, 14, 6, 13, 16, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[16], q[15];
cx q[18], q[19];
cx q[5], q[6];
