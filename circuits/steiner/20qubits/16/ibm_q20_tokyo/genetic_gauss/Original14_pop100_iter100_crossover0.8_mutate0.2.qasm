// Initial wiring: [1, 7, 14, 0, 10, 11, 13, 9, 15, 5, 3, 2, 4, 17, 18, 16, 19, 8, 12, 6]
// Resulting wiring: [1, 7, 14, 0, 10, 11, 13, 9, 15, 5, 3, 2, 4, 17, 18, 16, 19, 8, 12, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[3];
cx q[16], q[13];
cx q[13], q[4];
cx q[13], q[5];
cx q[14], q[9];
cx q[18], q[0];
cx q[19], q[15];
cx q[8], q[10];
cx q[8], q[9];
cx q[6], q[7];
cx q[10], q[19];
cx q[4], q[19];
cx q[1], q[19];
cx q[5], q[18];
cx q[3], q[16];
cx q[2], q[15];
