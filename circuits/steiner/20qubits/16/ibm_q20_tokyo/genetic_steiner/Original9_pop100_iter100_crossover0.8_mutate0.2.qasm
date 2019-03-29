// Initial wiring: [9, 12, 1, 3, 7, 13, 10, 0, 16, 5, 18, 15, 14, 17, 8, 19, 2, 11, 6, 4]
// Resulting wiring: [9, 12, 1, 3, 7, 13, 10, 0, 16, 5, 18, 15, 14, 17, 8, 19, 2, 11, 6, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[7], q[6];
cx q[13], q[12];
cx q[16], q[13];
cx q[17], q[12];
cx q[12], q[7];
cx q[17], q[16];
cx q[7], q[6];
cx q[16], q[14];
cx q[16], q[13];
cx q[6], q[4];
cx q[7], q[6];
cx q[17], q[16];
cx q[17], q[12];
cx q[13], q[14];
cx q[12], q[17];
cx q[9], q[11];
cx q[7], q[13];
cx q[13], q[14];
cx q[14], q[13];
cx q[4], q[5];
cx q[5], q[4];
cx q[2], q[8];
cx q[2], q[7];
