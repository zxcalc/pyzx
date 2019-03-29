// Initial wiring: [1, 7, 11, 15, 13, 17, 6, 19, 16, 14, 18, 4, 3, 5, 0, 8, 2, 12, 10, 9]
// Resulting wiring: [1, 7, 11, 15, 13, 17, 6, 19, 16, 14, 18, 4, 3, 5, 0, 8, 2, 12, 10, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[11], q[8];
cx q[8], q[0];
cx q[12], q[10];
cx q[13], q[12];
cx q[14], q[0];
cx q[13], q[1];
cx q[17], q[3];
cx q[17], q[7];
cx q[18], q[9];
cx q[18], q[15];
cx q[11], q[16];
cx q[11], q[13];
cx q[0], q[4];
cx q[4], q[19];
cx q[1], q[14];
