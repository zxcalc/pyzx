// Initial wiring: [4, 1, 0, 2, 13, 14, 11, 5, 6, 3, 10, 9, 8, 12, 7, 15]
// Resulting wiring: [4, 1, 0, 2, 13, 14, 11, 5, 6, 3, 10, 9, 8, 12, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[9], q[8];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[11], q[12];
cx q[9], q[10];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[4], q[5];
cx q[3], q[4];
cx q[1], q[2];
cx q[2], q[1];
