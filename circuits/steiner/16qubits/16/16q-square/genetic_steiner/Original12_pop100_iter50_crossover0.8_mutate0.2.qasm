// Initial wiring: [5, 4, 10, 15, 12, 9, 13, 7, 11, 2, 3, 14, 6, 0, 1, 8]
// Resulting wiring: [5, 4, 10, 15, 12, 9, 13, 7, 11, 2, 3, 14, 6, 0, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[2];
cx q[6], q[5];
cx q[7], q[6];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[11], q[4];
cx q[15], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[13], q[14];
cx q[10], q[11];
cx q[5], q[10];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[4];
