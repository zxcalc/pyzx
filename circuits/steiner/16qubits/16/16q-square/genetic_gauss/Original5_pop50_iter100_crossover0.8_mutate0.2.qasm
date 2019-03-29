// Initial wiring: [0, 15, 14, 7, 11, 6, 2, 13, 9, 1, 12, 10, 8, 4, 5, 3]
// Resulting wiring: [0, 15, 14, 7, 11, 6, 2, 13, 9, 1, 12, 10, 8, 4, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[6];
cx q[11], q[8];
cx q[10], q[4];
cx q[12], q[10];
cx q[15], q[12];
cx q[13], q[9];
cx q[11], q[14];
cx q[11], q[13];
cx q[4], q[14];
cx q[2], q[14];
cx q[1], q[2];
cx q[0], q[2];
cx q[0], q[9];
cx q[0], q[8];
cx q[1], q[7];
