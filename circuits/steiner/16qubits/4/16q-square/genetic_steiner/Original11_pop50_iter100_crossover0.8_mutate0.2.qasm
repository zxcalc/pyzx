// Initial wiring: [12, 10, 13, 7, 11, 5, 1, 9, 4, 14, 6, 15, 0, 3, 8, 2]
// Resulting wiring: [12, 10, 13, 7, 11, 5, 1, 9, 4, 14, 6, 15, 0, 3, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[12], q[13];
cx q[4], q[5];
cx q[2], q[3];
