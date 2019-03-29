// Initial wiring: [4, 5, 3, 13, 10, 11, 15, 2, 1, 14, 9, 8, 6, 12, 7, 0]
// Resulting wiring: [4, 5, 3, 13, 10, 11, 15, 2, 1, 14, 9, 8, 6, 12, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[1];
cx q[4], q[3];
cx q[10], q[7];
cx q[10], q[6];
cx q[11], q[7];
cx q[6], q[0];
cx q[8], q[5];
cx q[13], q[12];
cx q[15], q[1];
cx q[15], q[2];
cx q[14], q[7];
cx q[15], q[8];
cx q[2], q[11];
cx q[1], q[2];
cx q[0], q[1];
cx q[3], q[10];
