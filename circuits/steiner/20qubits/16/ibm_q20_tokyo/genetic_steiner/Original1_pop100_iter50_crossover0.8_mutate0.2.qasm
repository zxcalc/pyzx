// Initial wiring: [15, 4, 18, 17, 7, 1, 12, 2, 16, 9, 5, 0, 6, 10, 3, 13, 11, 14, 8, 19]
// Resulting wiring: [15, 4, 18, 17, 7, 1, 12, 2, 16, 9, 5, 0, 6, 10, 3, 13, 11, 14, 8, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[7], q[2];
cx q[10], q[9];
cx q[12], q[7];
cx q[12], q[11];
cx q[7], q[2];
cx q[13], q[12];
cx q[14], q[13];
cx q[16], q[13];
cx q[16], q[15];
cx q[13], q[12];
cx q[19], q[10];
cx q[14], q[16];
cx q[16], q[14];
cx q[10], q[11];
cx q[11], q[18];
cx q[5], q[6];
cx q[3], q[6];
cx q[0], q[1];
