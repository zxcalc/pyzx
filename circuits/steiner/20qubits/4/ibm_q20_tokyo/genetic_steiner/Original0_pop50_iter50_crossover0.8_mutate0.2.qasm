// Initial wiring: [5, 4, 8, 15, 14, 13, 7, 18, 6, 0, 19, 11, 10, 16, 12, 9, 2, 17, 1, 3]
// Resulting wiring: [5, 4, 8, 15, 14, 13, 7, 18, 6, 0, 19, 11, 10, 16, 12, 9, 2, 17, 1, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[9], q[8];
cx q[10], q[19];
cx q[5], q[6];
