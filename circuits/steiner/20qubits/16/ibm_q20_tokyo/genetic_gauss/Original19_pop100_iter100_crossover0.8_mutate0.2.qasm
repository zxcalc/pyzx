// Initial wiring: [1, 11, 8, 2, 18, 13, 0, 16, 5, 7, 14, 9, 6, 15, 4, 10, 17, 12, 3, 19]
// Resulting wiring: [1, 11, 8, 2, 18, 13, 0, 16, 5, 7, 14, 9, 6, 15, 4, 10, 17, 12, 3, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[6];
cx q[14], q[10];
cx q[17], q[14];
cx q[17], q[0];
cx q[10], q[4];
cx q[13], q[8];
cx q[15], q[16];
cx q[15], q[19];
cx q[2], q[3];
cx q[1], q[6];
cx q[0], q[1];
cx q[0], q[19];
cx q[4], q[15];
cx q[0], q[13];
cx q[5], q[12];
cx q[2], q[11];
