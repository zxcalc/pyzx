// Initial wiring: [4, 1, 13, 2, 9, 15, 0, 10, 5, 11, 14, 7, 6, 12, 8, 3]
// Resulting wiring: [4, 1, 13, 2, 9, 15, 0, 10, 5, 11, 14, 7, 6, 12, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[5], q[2];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[7], q[0];
cx q[6], q[5];
cx q[7], q[6];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[13], q[10];
cx q[14], q[13];
cx q[15], q[14];
cx q[9], q[10];
cx q[7], q[8];
cx q[6], q[9];
cx q[9], q[10];
cx q[10], q[9];
cx q[5], q[10];
cx q[0], q[1];
