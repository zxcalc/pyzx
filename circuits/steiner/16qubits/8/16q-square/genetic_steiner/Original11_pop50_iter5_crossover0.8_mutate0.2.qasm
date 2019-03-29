// Initial wiring: [5, 2, 4, 12, 14, 9, 6, 3, 0, 10, 11, 7, 13, 1, 15, 8]
// Resulting wiring: [5, 2, 4, 12, 14, 9, 6, 3, 0, 10, 11, 7, 13, 1, 15, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[6], q[5];
cx q[5], q[2];
cx q[9], q[8];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[9];
cx q[15], q[8];
cx q[8], q[7];
cx q[15], q[8];
cx q[11], q[12];
cx q[7], q[8];
cx q[4], q[5];
cx q[2], q[5];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[2];
cx q[0], q[7];
cx q[7], q[8];
cx q[8], q[7];
