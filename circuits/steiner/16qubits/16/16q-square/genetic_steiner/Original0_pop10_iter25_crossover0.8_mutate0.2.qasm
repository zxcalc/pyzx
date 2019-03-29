// Initial wiring: [8, 7, 10, 4, 11, 14, 1, 6, 9, 2, 12, 3, 5, 13, 15, 0]
// Resulting wiring: [8, 7, 10, 4, 11, 14, 1, 6, 9, 2, 12, 3, 5, 13, 15, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[3];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[2];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[9];
cx q[13], q[12];
cx q[9], q[8];
cx q[12], q[11];
cx q[10], q[9];
cx q[13], q[10];
cx q[13], q[12];
cx q[10], q[13];
cx q[9], q[10];
cx q[10], q[13];
cx q[7], q[8];
cx q[4], q[5];
cx q[5], q[6];
cx q[1], q[2];
