// Initial wiring: [10, 18, 11, 7, 5, 0, 17, 9, 15, 2, 1, 6, 8, 19, 16, 4, 14, 13, 3, 12]
// Resulting wiring: [10, 18, 11, 7, 5, 0, 17, 9, 15, 2, 1, 6, 8, 19, 16, 4, 14, 13, 3, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[5], q[4];
cx q[8], q[1];
cx q[12], q[11];
cx q[13], q[6];
cx q[15], q[14];
cx q[15], q[13];
cx q[17], q[16];
cx q[17], q[18];
cx q[15], q[16];
cx q[13], q[15];
cx q[15], q[13];
cx q[7], q[13];
cx q[6], q[13];
cx q[13], q[15];
cx q[3], q[5];
cx q[2], q[3];
cx q[3], q[5];
cx q[5], q[14];
cx q[0], q[9];
