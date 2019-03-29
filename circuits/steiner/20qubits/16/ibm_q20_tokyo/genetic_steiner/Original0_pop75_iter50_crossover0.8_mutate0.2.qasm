// Initial wiring: [1, 15, 9, 7, 19, 4, 6, 17, 3, 2, 10, 8, 11, 14, 18, 12, 0, 16, 13, 5]
// Resulting wiring: [1, 15, 9, 7, 19, 4, 6, 17, 3, 2, 10, 8, 11, 14, 18, 12, 0, 16, 13, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[11], q[10];
cx q[11], q[8];
cx q[13], q[12];
cx q[15], q[13];
cx q[17], q[16];
cx q[16], q[14];
cx q[16], q[13];
cx q[18], q[11];
cx q[8], q[9];
cx q[7], q[13];
cx q[6], q[12];
cx q[1], q[2];
cx q[0], q[9];
