// Initial wiring: [14, 8, 13, 2, 6, 19, 3, 1, 18, 7, 0, 16, 17, 4, 9, 10, 12, 5, 11, 15]
// Resulting wiring: [14, 8, 13, 2, 6, 19, 3, 1, 18, 7, 0, 16, 17, 4, 9, 10, 12, 5, 11, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[6], q[3];
cx q[12], q[6];
cx q[6], q[4];
cx q[12], q[11];
cx q[12], q[7];
cx q[12], q[6];
cx q[16], q[14];
cx q[19], q[10];
cx q[16], q[17];
cx q[15], q[16];
cx q[14], q[15];
cx q[11], q[17];
cx q[7], q[13];
cx q[5], q[6];
cx q[6], q[13];
cx q[4], q[5];
cx q[5], q[4];
cx q[2], q[8];
