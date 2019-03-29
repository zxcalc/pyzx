// Initial wiring: [10, 13, 3, 0, 12, 9, 14, 15, 6, 18, 7, 1, 4, 16, 5, 19, 11, 2, 8, 17]
// Resulting wiring: [10, 13, 3, 0, 12, 9, 14, 15, 6, 18, 7, 1, 4, 16, 5, 19, 11, 2, 8, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[9], q[0];
cx q[13], q[6];
cx q[4], q[6];
