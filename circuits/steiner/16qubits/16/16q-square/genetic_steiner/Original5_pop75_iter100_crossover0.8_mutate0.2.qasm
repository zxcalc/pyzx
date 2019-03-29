// Initial wiring: [4, 1, 10, 2, 12, 9, 0, 6, 15, 14, 5, 11, 8, 3, 7, 13]
// Resulting wiring: [4, 1, 10, 2, 12, 9, 0, 6, 15, 14, 5, 11, 8, 3, 7, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[1], q[0];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[6], q[5];
cx q[6], q[1];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[4];
cx q[13], q[12];
cx q[9], q[10];
cx q[8], q[15];
cx q[8], q[9];
cx q[6], q[9];
cx q[5], q[10];
cx q[4], q[11];
cx q[11], q[10];
cx q[2], q[5];
cx q[5], q[10];
cx q[0], q[1];
