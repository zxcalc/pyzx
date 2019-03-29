// Initial wiring: [6, 7, 0, 5, 15, 14, 1, 11, 16, 13, 3, 2, 19, 4, 18, 12, 17, 10, 8, 9]
// Resulting wiring: [6, 7, 0, 5, 15, 14, 1, 11, 16, 13, 3, 2, 19, 4, 18, 12, 17, 10, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[6], q[5];
cx q[7], q[2];
cx q[9], q[0];
cx q[13], q[6];
cx q[6], q[5];
cx q[15], q[13];
cx q[13], q[6];
cx q[6], q[4];
cx q[17], q[12];
cx q[18], q[11];
cx q[18], q[19];
cx q[16], q[17];
cx q[6], q[12];
cx q[6], q[7];
cx q[5], q[14];
cx q[14], q[16];
cx q[16], q[17];
cx q[17], q[16];
cx q[1], q[2];
