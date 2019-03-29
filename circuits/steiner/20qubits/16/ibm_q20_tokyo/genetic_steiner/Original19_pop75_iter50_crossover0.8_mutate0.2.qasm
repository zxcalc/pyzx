// Initial wiring: [2, 18, 9, 0, 7, 3, 11, 10, 14, 8, 4, 6, 17, 19, 5, 15, 1, 12, 13, 16]
// Resulting wiring: [2, 18, 9, 0, 7, 3, 11, 10, 14, 8, 4, 6, 17, 19, 5, 15, 1, 12, 13, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[6], q[3];
cx q[8], q[2];
cx q[9], q[8];
cx q[8], q[2];
cx q[9], q[0];
cx q[9], q[8];
cx q[10], q[8];
cx q[8], q[1];
cx q[11], q[10];
cx q[13], q[6];
cx q[15], q[14];
cx q[17], q[16];
cx q[17], q[11];
cx q[16], q[13];
cx q[11], q[10];
cx q[16], q[15];
cx q[13], q[6];
cx q[17], q[11];
cx q[18], q[11];
cx q[7], q[13];
cx q[7], q[12];
cx q[1], q[7];
