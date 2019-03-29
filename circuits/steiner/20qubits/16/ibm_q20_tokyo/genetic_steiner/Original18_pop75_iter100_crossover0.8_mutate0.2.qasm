// Initial wiring: [6, 12, 18, 17, 7, 13, 1, 16, 15, 10, 9, 19, 14, 0, 2, 4, 8, 11, 3, 5]
// Resulting wiring: [6, 12, 18, 17, 7, 13, 1, 16, 15, 10, 9, 19, 14, 0, 2, 4, 8, 11, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[0];
cx q[13], q[7];
cx q[14], q[13];
cx q[16], q[13];
cx q[16], q[14];
cx q[13], q[7];
cx q[18], q[12];
cx q[15], q[16];
cx q[12], q[13];
cx q[10], q[11];
cx q[9], q[11];
cx q[8], q[11];
cx q[6], q[13];
cx q[2], q[7];
cx q[1], q[8];
cx q[0], q[1];
