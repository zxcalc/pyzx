// Initial wiring: [1, 10, 5, 3, 9, 19, 17, 14, 12, 4, 18, 8, 6, 2, 11, 7, 13, 15, 0, 16]
// Resulting wiring: [1, 10, 5, 3, 9, 19, 17, 14, 12, 4, 18, 8, 6, 2, 11, 7, 13, 15, 0, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[11], q[8];
cx q[13], q[6];
cx q[15], q[13];
cx q[16], q[13];
cx q[18], q[12];
cx q[18], q[17];
cx q[12], q[7];
cx q[19], q[10];
cx q[10], q[8];
cx q[8], q[7];
cx q[19], q[10];
cx q[9], q[11];
cx q[7], q[13];
cx q[5], q[14];
cx q[4], q[5];
