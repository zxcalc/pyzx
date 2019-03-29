// Initial wiring: [6, 5, 9, 4, 8, 0, 2, 7, 13, 1, 11, 10, 15, 12, 14, 3]
// Resulting wiring: [6, 5, 9, 4, 8, 0, 2, 7, 13, 1, 11, 10, 15, 12, 14, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[0];
cx q[5], q[2];
cx q[8], q[3];
cx q[10], q[4];
cx q[2], q[13];
cx q[0], q[2];
cx q[0], q[10];
cx q[0], q[8];
