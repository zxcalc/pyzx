// Initial wiring: [3, 14, 6, 15, 13, 18, 0, 10, 19, 8, 7, 4, 2, 9, 1, 12, 17, 5, 11, 16]
// Resulting wiring: [3, 14, 6, 15, 13, 18, 0, 10, 19, 8, 7, 4, 2, 9, 1, 12, 17, 5, 11, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[16], q[3];
cx q[14], q[6];
cx q[19], q[10];
