// Initial wiring: [6, 16, 13, 8, 9, 0, 5, 2, 3, 1, 10, 7, 15, 12, 11, 14, 17, 18, 4, 19]
// Resulting wiring: [6, 16, 13, 8, 9, 0, 5, 2, 3, 1, 10, 7, 15, 12, 11, 14, 17, 18, 4, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[16], q[0];
cx q[16], q[1];
cx q[13], q[4];
cx q[12], q[5];
cx q[13], q[6];
cx q[16], q[9];
cx q[19], q[8];
cx q[9], q[18];
cx q[8], q[18];
cx q[10], q[13];
cx q[0], q[19];
cx q[19], q[0];
cx q[2], q[17];
cx q[4], q[10];
cx q[1], q[6];
