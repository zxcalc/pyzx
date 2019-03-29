// Initial wiring: [18, 13, 6, 1, 4, 17, 16, 19, 3, 7, 8, 2, 14, 5, 9, 10, 12, 11, 15, 0]
// Resulting wiring: [18, 13, 6, 1, 4, 17, 16, 19, 3, 7, 8, 2, 14, 5, 9, 10, 12, 11, 15, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[3], q[2];
cx q[5], q[3];
cx q[3], q[2];
cx q[6], q[4];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[4];
cx q[7], q[6];
cx q[8], q[7];
cx q[16], q[14];
cx q[16], q[13];
cx q[18], q[19];
cx q[15], q[16];
cx q[14], q[15];
cx q[8], q[11];
cx q[7], q[8];
cx q[5], q[6];
cx q[6], q[13];
cx q[3], q[4];
cx q[2], q[7];
cx q[7], q[2];
