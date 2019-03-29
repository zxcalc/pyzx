// Initial wiring: [3, 7, 15, 6, 0, 12, 4, 2, 10, 1, 9, 14, 8, 13, 5, 11]
// Resulting wiring: [3, 7, 15, 6, 0, 12, 4, 2, 10, 1, 9, 14, 8, 13, 5, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[8], q[7];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[13], q[10];
cx q[15], q[8];
cx q[8], q[7];
cx q[13], q[14];
cx q[14], q[15];
cx q[12], q[13];
cx q[9], q[10];
cx q[0], q[1];
