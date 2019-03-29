// Initial wiring: [1, 12, 18, 16, 7, 6, 10, 11, 5, 8, 4, 0, 17, 14, 3, 13, 9, 15, 19, 2]
// Resulting wiring: [1, 12, 18, 16, 7, 6, 10, 11, 5, 8, 4, 0, 17, 14, 3, 13, 9, 15, 19, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[5], q[3];
cx q[6], q[3];
cx q[11], q[8];
cx q[13], q[6];
cx q[6], q[3];
cx q[13], q[6];
cx q[16], q[14];
cx q[17], q[16];
cx q[16], q[14];
cx q[17], q[11];
cx q[14], q[5];
cx q[11], q[8];
cx q[17], q[16];
cx q[18], q[12];
cx q[12], q[7];
cx q[12], q[6];
cx q[7], q[1];
cx q[6], q[5];
cx q[15], q[16];
cx q[11], q[18];
cx q[4], q[5];
cx q[2], q[8];
