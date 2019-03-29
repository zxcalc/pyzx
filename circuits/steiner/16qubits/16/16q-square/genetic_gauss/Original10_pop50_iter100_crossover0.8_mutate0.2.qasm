// Initial wiring: [6, 5, 8, 7, 3, 0, 9, 13, 4, 10, 12, 2, 14, 1, 15, 11]
// Resulting wiring: [6, 5, 8, 7, 3, 0, 9, 13, 4, 10, 12, 2, 14, 1, 15, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[11], q[8];
cx q[7], q[1];
cx q[13], q[6];
cx q[15], q[9];
cx q[13], q[11];
cx q[9], q[11];
cx q[8], q[10];
cx q[10], q[14];
cx q[3], q[4];
cx q[4], q[3];
cx q[1], q[15];
cx q[0], q[14];
cx q[2], q[7];
