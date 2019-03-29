// Initial wiring: [9, 7, 15, 18, 19, 6, 14, 5, 8, 16, 17, 10, 3, 1, 0, 4, 13, 12, 11, 2]
// Resulting wiring: [9, 7, 15, 18, 19, 6, 14, 5, 8, 16, 17, 10, 3, 1, 0, 4, 13, 12, 11, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[9], q[8];
cx q[8], q[1];
cx q[9], q[0];
cx q[11], q[10];
cx q[12], q[7];
cx q[7], q[1];
cx q[15], q[13];
cx q[13], q[7];
cx q[15], q[14];
cx q[7], q[1];
cx q[16], q[13];
cx q[13], q[7];
cx q[16], q[13];
cx q[18], q[19];
cx q[6], q[7];
cx q[5], q[14];
cx q[4], q[6];
cx q[6], q[12];
cx q[6], q[7];
cx q[2], q[7];
