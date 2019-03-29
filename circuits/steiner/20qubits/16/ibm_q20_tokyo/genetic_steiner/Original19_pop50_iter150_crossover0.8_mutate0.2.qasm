// Initial wiring: [3, 16, 14, 4, 12, 17, 10, 18, 0, 7, 13, 11, 1, 19, 5, 15, 2, 8, 9, 6]
// Resulting wiring: [3, 16, 14, 4, 12, 17, 10, 18, 0, 7, 13, 11, 1, 19, 5, 15, 2, 8, 9, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[4], q[3];
cx q[6], q[5];
cx q[9], q[8];
cx q[11], q[8];
cx q[12], q[6];
cx q[15], q[14];
cx q[17], q[16];
cx q[17], q[18];
cx q[12], q[13];
cx q[10], q[19];
cx q[6], q[13];
cx q[13], q[15];
cx q[6], q[12];
cx q[4], q[6];
cx q[6], q[12];
cx q[12], q[13];
cx q[13], q[15];
cx q[12], q[11];
cx q[12], q[6];
cx q[2], q[7];
cx q[7], q[6];
