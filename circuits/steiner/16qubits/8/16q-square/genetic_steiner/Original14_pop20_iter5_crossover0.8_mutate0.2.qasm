// Initial wiring: [4, 10, 7, 14, 11, 6, 2, 15, 13, 9, 0, 5, 1, 12, 8, 3]
// Resulting wiring: [4, 10, 7, 14, 11, 6, 2, 15, 13, 9, 0, 5, 1, 12, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[4], q[3];
cx q[5], q[4];
cx q[6], q[1];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[10];
cx q[13], q[14];
cx q[10], q[13];
cx q[5], q[10];
cx q[10], q[13];
cx q[13], q[14];
cx q[13], q[10];
