// Initial wiring: [14, 9, 11, 5, 12, 3, 1, 4, 6, 17, 13, 19, 15, 7, 18, 8, 10, 2, 16, 0]
// Resulting wiring: [14, 9, 11, 5, 12, 3, 1, 4, 6, 17, 13, 19, 15, 7, 18, 8, 10, 2, 16, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[0];
cx q[10], q[5];
cx q[16], q[13];
cx q[17], q[15];
cx q[15], q[9];
cx q[13], q[10];
cx q[19], q[15];
cx q[19], q[16];
cx q[6], q[19];
cx q[6], q[18];
cx q[10], q[13];
cx q[0], q[2];
cx q[2], q[19];
cx q[0], q[15];
cx q[3], q[12];
cx q[2], q[10];
