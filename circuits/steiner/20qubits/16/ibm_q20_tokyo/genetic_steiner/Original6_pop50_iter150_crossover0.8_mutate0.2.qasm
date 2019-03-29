// Initial wiring: [1, 5, 7, 6, 16, 18, 11, 4, 9, 15, 13, 10, 12, 0, 19, 8, 17, 14, 3, 2]
// Resulting wiring: [1, 5, 7, 6, 16, 18, 11, 4, 9, 15, 13, 10, 12, 0, 19, 8, 17, 14, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[4], q[3];
cx q[5], q[3];
cx q[7], q[1];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[13], q[12];
cx q[13], q[6];
cx q[14], q[5];
cx q[18], q[12];
cx q[12], q[7];
cx q[18], q[19];
cx q[15], q[16];
