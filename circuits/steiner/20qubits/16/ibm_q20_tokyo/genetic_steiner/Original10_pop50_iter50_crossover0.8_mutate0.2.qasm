// Initial wiring: [11, 19, 18, 6, 15, 0, 12, 10, 9, 7, 17, 2, 14, 8, 3, 16, 4, 5, 13, 1]
// Resulting wiring: [11, 19, 18, 6, 15, 0, 12, 10, 9, 7, 17, 2, 14, 8, 3, 16, 4, 5, 13, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[5], q[4];
cx q[5], q[3];
cx q[8], q[1];
cx q[11], q[10];
cx q[15], q[13];
cx q[13], q[6];
cx q[13], q[7];
cx q[6], q[3];
cx q[15], q[13];
cx q[16], q[13];
cx q[18], q[11];
cx q[9], q[11];
cx q[6], q[7];
cx q[3], q[6];
cx q[6], q[12];
cx q[2], q[3];
cx q[3], q[6];
cx q[6], q[12];
cx q[12], q[11];
cx q[6], q[3];
