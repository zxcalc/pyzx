// Initial wiring: [8, 1, 13, 5, 11, 9, 14, 0, 12, 4, 2, 10, 3, 7, 6, 15]
// Resulting wiring: [8, 1, 13, 5, 11, 9, 14, 0, 12, 4, 2, 10, 3, 7, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[10], q[9];
cx q[9], q[8];
cx q[13], q[12];
cx q[14], q[15];
cx q[12], q[13];
cx q[8], q[15];
cx q[4], q[11];
cx q[11], q[10];
cx q[2], q[5];
cx q[2], q[3];
cx q[5], q[10];
cx q[3], q[4];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[10];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[1];
