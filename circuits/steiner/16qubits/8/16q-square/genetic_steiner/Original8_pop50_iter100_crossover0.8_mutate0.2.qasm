// Initial wiring: [11, 12, 1, 7, 15, 13, 8, 5, 9, 3, 6, 10, 4, 2, 0, 14]
// Resulting wiring: [11, 12, 1, 7, 15, 13, 8, 5, 9, 3, 6, 10, 4, 2, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[2];
cx q[9], q[6];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[13], q[10];
cx q[3], q[4];
cx q[2], q[3];
