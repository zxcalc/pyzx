// Initial wiring: [4, 12, 10, 11, 1, 15, 7, 3, 8, 14, 6, 13, 0, 5, 9, 2]
// Resulting wiring: [4, 12, 10, 11, 1, 15, 7, 3, 8, 14, 6, 13, 0, 5, 9, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[8], q[7];
cx q[7], q[6];
cx q[13], q[12];
cx q[14], q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[15];
cx q[5], q[10];
cx q[6], q[9];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[3];
cx q[1], q[6];
cx q[6], q[5];
cx q[0], q[1];
cx q[1], q[6];
cx q[6], q[9];
cx q[0], q[7];
cx q[6], q[5];
