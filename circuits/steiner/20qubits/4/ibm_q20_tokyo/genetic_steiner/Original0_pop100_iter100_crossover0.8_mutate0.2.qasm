// Initial wiring: [14, 2, 6, 1, 13, 7, 12, 0, 17, 11, 19, 3, 16, 5, 10, 8, 4, 9, 15, 18]
// Resulting wiring: [14, 2, 6, 1, 13, 7, 12, 0, 17, 11, 19, 3, 16, 5, 10, 8, 4, 9, 15, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[16], q[13];
cx q[10], q[11];
cx q[4], q[5];
