// Initial wiring: [7, 15, 11, 8, 10, 6, 17, 2, 9, 0, 1, 19, 16, 12, 18, 4, 5, 3, 13, 14]
// Resulting wiring: [7, 15, 11, 8, 10, 6, 17, 2, 9, 0, 1, 19, 16, 12, 18, 4, 5, 3, 13, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[8], q[7];
cx q[9], q[0];
cx q[10], q[9];
cx q[13], q[6];
cx q[15], q[14];
cx q[18], q[12];
cx q[12], q[6];
cx q[19], q[10];
cx q[10], q[9];
cx q[13], q[14];
cx q[8], q[9];
cx q[6], q[12];
cx q[5], q[6];
cx q[6], q[12];
cx q[12], q[11];
cx q[11], q[9];
cx q[4], q[5];
cx q[2], q[3];
