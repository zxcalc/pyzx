// Initial wiring: [1, 5, 16, 2, 10, 15, 18, 0, 4, 9, 17, 14, 13, 11, 6, 8, 7, 12, 3, 19]
// Resulting wiring: [1, 5, 16, 2, 10, 15, 18, 0, 4, 9, 17, 14, 13, 11, 6, 8, 7, 12, 3, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[7], q[1];
cx q[8], q[2];
cx q[9], q[8];
cx q[10], q[8];
cx q[12], q[11];
cx q[13], q[7];
cx q[7], q[2];
cx q[13], q[6];
cx q[15], q[14];
cx q[13], q[16];
cx q[12], q[18];
cx q[10], q[19];
cx q[10], q[11];
cx q[9], q[11];
cx q[8], q[10];
cx q[10], q[19];
cx q[8], q[11];
cx q[19], q[10];
cx q[5], q[6];
