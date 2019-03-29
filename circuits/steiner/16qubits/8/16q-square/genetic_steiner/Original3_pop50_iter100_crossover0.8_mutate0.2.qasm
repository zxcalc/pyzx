// Initial wiring: [9, 5, 2, 11, 10, 8, 6, 7, 13, 0, 4, 12, 15, 3, 1, 14]
// Resulting wiring: [9, 5, 2, 11, 10, 8, 6, 7, 13, 0, 4, 12, 15, 3, 1, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[3], q[2];
cx q[5], q[2];
cx q[10], q[9];
cx q[9], q[8];
cx q[13], q[10];
cx q[11], q[12];
