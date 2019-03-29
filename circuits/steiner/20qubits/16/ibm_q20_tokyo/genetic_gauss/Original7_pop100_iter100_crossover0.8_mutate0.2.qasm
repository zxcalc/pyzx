// Initial wiring: [5, 14, 11, 1, 8, 15, 7, 9, 3, 12, 4, 18, 6, 16, 2, 0, 10, 13, 19, 17]
// Resulting wiring: [5, 14, 11, 1, 8, 15, 7, 9, 3, 12, 4, 18, 6, 16, 2, 0, 10, 13, 19, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[5], q[3];
cx q[10], q[8];
cx q[11], q[10];
cx q[7], q[4];
cx q[12], q[3];
cx q[16], q[12];
cx q[13], q[5];
cx q[13], q[6];
cx q[18], q[12];
cx q[18], q[19];
cx q[16], q[19];
cx q[7], q[11];
cx q[1], q[15];
cx q[3], q[14];
cx q[2], q[6];
