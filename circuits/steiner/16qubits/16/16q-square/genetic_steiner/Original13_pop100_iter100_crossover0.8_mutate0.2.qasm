// Initial wiring: [5, 10, 8, 13, 9, 3, 0, 6, 11, 1, 4, 14, 12, 15, 7, 2]
// Resulting wiring: [5, 10, 8, 13, 9, 3, 0, 6, 11, 1, 4, 14, 12, 15, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[1];
cx q[7], q[0];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[2];
cx q[11], q[4];
cx q[12], q[11];
cx q[15], q[8];
cx q[10], q[13];
cx q[13], q[14];
cx q[5], q[10];
cx q[10], q[13];
cx q[10], q[5];
cx q[4], q[5];
cx q[5], q[10];
cx q[10], q[13];
