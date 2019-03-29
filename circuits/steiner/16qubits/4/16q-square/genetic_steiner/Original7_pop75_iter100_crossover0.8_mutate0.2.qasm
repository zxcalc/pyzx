// Initial wiring: [12, 15, 5, 1, 14, 9, 11, 4, 6, 8, 3, 7, 10, 2, 13, 0]
// Resulting wiring: [12, 15, 5, 1, 14, 9, 11, 4, 6, 8, 3, 7, 10, 2, 13, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[6], q[5];
cx q[2], q[3];
