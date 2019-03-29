// Initial wiring: [12, 11, 7, 9, 8, 5, 16, 17, 15, 0, 3, 14, 1, 2, 4, 10, 13, 19, 18, 6]
// Resulting wiring: [12, 11, 7, 9, 8, 5, 16, 17, 15, 0, 3, 14, 1, 2, 4, 10, 13, 19, 18, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[7], q[2];
cx q[11], q[8];
cx q[11], q[10];
cx q[8], q[2];
cx q[12], q[11];
cx q[11], q[10];
cx q[13], q[7];
cx q[14], q[5];
cx q[5], q[4];
cx q[5], q[3];
cx q[16], q[17];
cx q[15], q[16];
cx q[14], q[15];
cx q[13], q[16];
cx q[13], q[15];
cx q[9], q[10];
cx q[8], q[10];
cx q[0], q[1];
