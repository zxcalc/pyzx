// Initial wiring: [11, 10, 2, 3, 14, 1, 13, 15, 19, 0, 9, 16, 4, 7, 6, 12, 18, 17, 8, 5]
// Resulting wiring: [11, 10, 2, 3, 14, 1, 13, 15, 19, 0, 9, 16, 4, 7, 6, 12, 18, 17, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[8], q[7];
cx q[10], q[9];
cx q[11], q[10];
cx q[11], q[8];
cx q[12], q[11];
cx q[12], q[7];
cx q[11], q[8];
cx q[7], q[1];
cx q[12], q[6];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[14], q[5];
cx q[13], q[12];
cx q[14], q[13];
cx q[16], q[15];
cx q[17], q[11];
cx q[8], q[10];
cx q[2], q[3];
cx q[1], q[2];
