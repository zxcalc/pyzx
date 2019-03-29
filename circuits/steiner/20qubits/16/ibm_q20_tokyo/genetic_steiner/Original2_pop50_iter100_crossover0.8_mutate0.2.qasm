// Initial wiring: [10, 16, 17, 7, 18, 3, 12, 1, 11, 19, 8, 6, 0, 13, 15, 5, 2, 9, 4, 14]
// Resulting wiring: [10, 16, 17, 7, 18, 3, 12, 1, 11, 19, 8, 6, 0, 13, 15, 5, 2, 9, 4, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[7], q[2];
cx q[12], q[11];
cx q[11], q[10];
cx q[16], q[13];
cx q[13], q[7];
cx q[7], q[1];
cx q[1], q[0];
cx q[13], q[7];
cx q[17], q[16];
cx q[13], q[14];
cx q[12], q[18];
cx q[6], q[13];
cx q[5], q[6];
cx q[1], q[8];
