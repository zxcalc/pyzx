// Initial wiring: [1, 16, 13, 14, 18, 8, 3, 12, 7, 15, 0, 17, 9, 6, 4, 2, 10, 5, 19, 11]
// Resulting wiring: [1, 16, 13, 14, 18, 8, 3, 12, 7, 15, 0, 17, 9, 6, 4, 2, 10, 5, 19, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[11], q[8];
cx q[8], q[7];
cx q[8], q[2];
cx q[8], q[1];
cx q[12], q[7];
cx q[7], q[1];
cx q[16], q[15];
cx q[17], q[16];
cx q[16], q[13];
cx q[17], q[16];
cx q[18], q[12];
cx q[13], q[15];
cx q[13], q[14];
cx q[11], q[18];
cx q[8], q[10];
cx q[6], q[7];
cx q[3], q[4];
cx q[2], q[7];
