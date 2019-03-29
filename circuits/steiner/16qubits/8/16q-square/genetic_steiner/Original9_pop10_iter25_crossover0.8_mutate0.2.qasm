// Initial wiring: [4, 11, 10, 2, 12, 8, 14, 13, 5, 6, 3, 1, 15, 9, 0, 7]
// Resulting wiring: [4, 11, 10, 2, 12, 8, 14, 13, 5, 6, 3, 1, 15, 9, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[2];
cx q[5], q[4];
cx q[9], q[6];
cx q[9], q[8];
cx q[6], q[5];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[9];
cx q[12], q[11];
cx q[11], q[10];
cx q[6], q[9];
cx q[5], q[6];
cx q[6], q[5];
cx q[4], q[5];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[9];
cx q[6], q[5];
