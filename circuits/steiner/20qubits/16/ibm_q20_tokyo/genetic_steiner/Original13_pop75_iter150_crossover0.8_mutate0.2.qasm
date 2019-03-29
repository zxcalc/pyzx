// Initial wiring: [8, 11, 9, 4, 12, 18, 17, 2, 1, 14, 7, 0, 19, 16, 6, 13, 10, 3, 15, 5]
// Resulting wiring: [8, 11, 9, 4, 12, 18, 17, 2, 1, 14, 7, 0, 19, 16, 6, 13, 10, 3, 15, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[7], q[6];
cx q[11], q[10];
cx q[14], q[13];
cx q[15], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[8];
cx q[13], q[6];
cx q[16], q[14];
cx q[9], q[11];
cx q[8], q[11];
cx q[4], q[6];
cx q[4], q[5];
cx q[3], q[5];
cx q[2], q[8];
cx q[8], q[11];
cx q[2], q[7];
cx q[11], q[8];
