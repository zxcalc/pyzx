// Initial wiring: [7, 2, 15, 0, 16, 5, 1, 4, 3, 11, 14, 19, 6, 17, 9, 12, 10, 8, 13, 18]
// Resulting wiring: [7, 2, 15, 0, 16, 5, 1, 4, 3, 11, 14, 19, 6, 17, 9, 12, 10, 8, 13, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[8], q[1];
cx q[11], q[8];
cx q[8], q[7];
cx q[13], q[12];
cx q[13], q[6];
cx q[12], q[11];
cx q[6], q[4];
cx q[14], q[5];
cx q[15], q[14];
cx q[14], q[5];
cx q[16], q[15];
cx q[18], q[19];
cx q[14], q[16];
cx q[11], q[12];
cx q[6], q[7];
cx q[4], q[5];
cx q[2], q[3];
