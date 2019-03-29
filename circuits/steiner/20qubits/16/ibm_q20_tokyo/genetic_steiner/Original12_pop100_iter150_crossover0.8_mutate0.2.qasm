// Initial wiring: [15, 14, 11, 19, 16, 6, 13, 12, 1, 7, 0, 3, 10, 4, 5, 8, 9, 18, 2, 17]
// Resulting wiring: [15, 14, 11, 19, 16, 6, 13, 12, 1, 7, 0, 3, 10, 4, 5, 8, 9, 18, 2, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[6], q[3];
cx q[7], q[2];
cx q[8], q[1];
cx q[10], q[9];
cx q[13], q[12];
cx q[13], q[6];
cx q[18], q[12];
cx q[12], q[6];
cx q[19], q[10];
cx q[10], q[9];
cx q[19], q[10];
cx q[18], q[19];
cx q[14], q[15];
cx q[13], q[16];
cx q[13], q[15];
cx q[13], q[14];
cx q[10], q[11];
cx q[9], q[11];
cx q[8], q[11];
cx q[0], q[9];
cx q[9], q[11];
