// Initial wiring: [3, 4, 13, 9, 5, 6, 0, 12, 15, 11, 10, 2, 8, 7, 14, 1]
// Resulting wiring: [3, 4, 13, 9, 5, 6, 0, 12, 15, 11, 10, 2, 8, 7, 14, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[10], q[9];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[11];
cx q[9], q[10];
cx q[10], q[11];
cx q[11], q[10];
cx q[7], q[8];
cx q[1], q[6];
cx q[1], q[2];
cx q[0], q[1];
