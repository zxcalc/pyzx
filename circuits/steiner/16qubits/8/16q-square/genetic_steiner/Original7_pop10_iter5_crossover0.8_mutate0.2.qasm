// Initial wiring: [10, 6, 7, 4, 5, 3, 12, 8, 1, 9, 14, 11, 2, 13, 15, 0]
// Resulting wiring: [10, 6, 7, 4, 5, 3, 12, 8, 1, 9, 14, 11, 2, 13, 15, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[2];
cx q[5], q[2];
cx q[10], q[5];
cx q[5], q[2];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[10];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[13], q[10];
cx q[15], q[8];
cx q[8], q[15];
cx q[7], q[8];
cx q[8], q[15];
cx q[15], q[8];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
