// Initial wiring: [3, 11, 12, 5, 9, 15, 14, 6, 8, 13, 0, 7, 4, 2, 10, 1]
// Resulting wiring: [3, 11, 12, 5, 9, 15, 14, 6, 8, 13, 0, 7, 4, 2, 10, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[5], q[2];
cx q[9], q[8];
cx q[11], q[4];
cx q[12], q[11];
cx q[13], q[10];
cx q[14], q[13];
cx q[14], q[9];
cx q[12], q[13];
cx q[13], q[14];
cx q[14], q[13];
cx q[10], q[13];
cx q[13], q[14];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[9];
cx q[5], q[10];
cx q[1], q[6];
cx q[6], q[9];
cx q[0], q[1];
cx q[1], q[6];
cx q[6], q[9];
