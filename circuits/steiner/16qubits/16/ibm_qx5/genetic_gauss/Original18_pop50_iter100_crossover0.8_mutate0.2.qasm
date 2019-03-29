// Initial wiring: [6, 10, 8, 5, 2, 4, 1, 3, 14, 12, 7, 11, 0, 9, 13, 15]
// Resulting wiring: [6, 10, 8, 5, 2, 4, 1, 3, 14, 12, 7, 11, 0, 9, 13, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[4];
cx q[7], q[5];
cx q[7], q[4];
cx q[8], q[5];
cx q[11], q[6];
cx q[13], q[4];
cx q[13], q[11];
cx q[11], q[15];
cx q[10], q[15];
cx q[6], q[8];
cx q[9], q[14];
cx q[8], q[13];
cx q[2], q[12];
cx q[0], q[2];
cx q[2], q[15];
cx q[3], q[11];
