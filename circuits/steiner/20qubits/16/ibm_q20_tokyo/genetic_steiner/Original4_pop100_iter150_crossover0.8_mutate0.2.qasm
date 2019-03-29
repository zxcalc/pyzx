// Initial wiring: [4, 11, 12, 0, 6, 1, 18, 17, 10, 15, 19, 9, 5, 8, 7, 16, 3, 13, 2, 14]
// Resulting wiring: [4, 11, 12, 0, 6, 1, 18, 17, 10, 15, 19, 9, 5, 8, 7, 16, 3, 13, 2, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[9], q[8];
cx q[11], q[8];
cx q[8], q[1];
cx q[11], q[8];
cx q[12], q[7];
cx q[7], q[2];
cx q[7], q[1];
cx q[12], q[11];
cx q[12], q[7];
cx q[15], q[13];
cx q[16], q[13];
cx q[17], q[11];
cx q[17], q[18];
cx q[10], q[19];
cx q[9], q[10];
cx q[8], q[11];
cx q[7], q[13];
cx q[6], q[12];
cx q[3], q[5];
cx q[2], q[3];
cx q[3], q[5];
