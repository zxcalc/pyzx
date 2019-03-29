// Initial wiring: [14, 1, 17, 9, 10, 11, 13, 8, 3, 0, 15, 16, 12, 7, 6, 5, 18, 2, 19, 4]
// Resulting wiring: [14, 1, 17, 9, 10, 11, 13, 8, 3, 0, 15, 16, 12, 7, 6, 5, 18, 2, 19, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[0];
cx q[16], q[19];
cx q[5], q[15];
cx q[4], q[10];
