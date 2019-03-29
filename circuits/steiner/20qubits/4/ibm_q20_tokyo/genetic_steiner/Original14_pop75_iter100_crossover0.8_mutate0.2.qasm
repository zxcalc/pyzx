// Initial wiring: [2, 14, 15, 1, 18, 3, 8, 6, 4, 9, 7, 0, 17, 10, 13, 12, 5, 19, 11, 16]
// Resulting wiring: [2, 14, 15, 1, 18, 3, 8, 6, 4, 9, 7, 0, 17, 10, 13, 12, 5, 19, 11, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[5];
cx q[9], q[10];
cx q[1], q[2];
cx q[0], q[1];
