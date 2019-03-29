// Initial wiring: [2, 18, 7, 13, 15, 16, 10, 4, 11, 17, 3, 8, 12, 5, 1, 14, 19, 9, 0, 6]
// Resulting wiring: [2, 18, 7, 13, 15, 16, 10, 4, 11, 17, 3, 8, 12, 5, 1, 14, 19, 9, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[3], q[2];
cx q[5], q[4];
cx q[6], q[3];
cx q[6], q[5];
cx q[3], q[2];
cx q[8], q[2];
cx q[13], q[7];
cx q[14], q[5];
cx q[16], q[14];
cx q[16], q[17];
cx q[13], q[14];
cx q[11], q[18];
cx q[10], q[19];
cx q[8], q[11];
cx q[8], q[10];
cx q[6], q[13];
cx q[13], q[14];
cx q[5], q[6];
