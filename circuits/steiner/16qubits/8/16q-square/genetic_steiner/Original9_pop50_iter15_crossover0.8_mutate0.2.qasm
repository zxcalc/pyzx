// Initial wiring: [2, 7, 14, 15, 1, 6, 12, 8, 11, 10, 5, 3, 9, 13, 4, 0]
// Resulting wiring: [2, 7, 14, 15, 1, 6, 12, 8, 11, 10, 5, 3, 9, 13, 4, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[9], q[8];
cx q[9], q[6];
cx q[11], q[10];
cx q[8], q[9];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[8];
cx q[3], q[4];
cx q[4], q[11];
