// Initial wiring: [8, 13, 15, 11, 19, 0, 16, 18, 3, 4, 14, 17, 5, 6, 9, 2, 1, 12, 7, 10]
// Resulting wiring: [8, 13, 15, 11, 19, 0, 16, 18, 3, 4, 14, 17, 5, 6, 9, 2, 1, 12, 7, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[10], q[8];
cx q[16], q[13];
cx q[0], q[1];
