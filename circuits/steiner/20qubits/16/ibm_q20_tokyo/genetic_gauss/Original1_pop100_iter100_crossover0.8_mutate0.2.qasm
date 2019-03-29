// Initial wiring: [1, 17, 9, 12, 5, 0, 2, 14, 8, 19, 11, 3, 16, 15, 13, 10, 7, 4, 6, 18]
// Resulting wiring: [1, 17, 9, 12, 5, 0, 2, 14, 8, 19, 11, 3, 16, 15, 13, 10, 7, 4, 6, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[2];
cx q[11], q[10];
cx q[9], q[4];
cx q[18], q[5];
cx q[18], q[6];
cx q[19], q[17];
cx q[18], q[19];
cx q[13], q[17];
cx q[10], q[11];
cx q[10], q[18];
cx q[10], q[15];
cx q[11], q[14];
cx q[4], q[5];
cx q[1], q[3];
cx q[0], q[3];
cx q[5], q[8];
