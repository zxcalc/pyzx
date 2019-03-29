// Initial wiring: [13, 8, 19, 7, 2, 5, 9, 11, 6, 1, 3, 12, 10, 0, 18, 16, 15, 14, 17, 4]
// Resulting wiring: [13, 8, 19, 7, 2, 5, 9, 11, 6, 1, 3, 12, 10, 0, 18, 16, 15, 14, 17, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[14];
cx q[10], q[19];
cx q[3], q[4];
cx q[1], q[7];
