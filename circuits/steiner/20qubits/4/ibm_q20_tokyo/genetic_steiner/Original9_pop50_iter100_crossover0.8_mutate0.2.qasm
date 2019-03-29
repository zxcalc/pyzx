// Initial wiring: [5, 11, 9, 16, 19, 3, 13, 6, 15, 1, 12, 4, 0, 7, 8, 14, 10, 2, 17, 18]
// Resulting wiring: [5, 11, 9, 16, 19, 3, 13, 6, 15, 1, 12, 4, 0, 7, 8, 14, 10, 2, 17, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[8];
cx q[16], q[14];
cx q[13], q[14];
cx q[3], q[4];
