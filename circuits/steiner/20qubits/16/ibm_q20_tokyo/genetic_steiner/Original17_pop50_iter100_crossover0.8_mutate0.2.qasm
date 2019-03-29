// Initial wiring: [16, 17, 1, 2, 7, 8, 3, 4, 9, 5, 12, 15, 0, 19, 14, 11, 6, 13, 18, 10]
// Resulting wiring: [16, 17, 1, 2, 7, 8, 3, 4, 9, 5, 12, 15, 0, 19, 14, 11, 6, 13, 18, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[6], q[3];
cx q[10], q[9];
cx q[10], q[8];
cx q[13], q[6];
cx q[16], q[13];
cx q[17], q[18];
cx q[13], q[16];
cx q[11], q[12];
cx q[10], q[19];
cx q[8], q[10];
cx q[10], q[19];
cx q[19], q[10];
cx q[6], q[7];
cx q[2], q[7];
cx q[7], q[13];
cx q[1], q[7];
cx q[7], q[13];
cx q[1], q[2];
cx q[0], q[9];
