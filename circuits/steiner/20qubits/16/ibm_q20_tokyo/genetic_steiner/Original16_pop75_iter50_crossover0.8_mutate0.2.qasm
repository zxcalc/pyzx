// Initial wiring: [6, 19, 15, 11, 17, 2, 16, 4, 12, 9, 8, 13, 1, 0, 5, 7, 3, 18, 14, 10]
// Resulting wiring: [6, 19, 15, 11, 17, 2, 16, 4, 12, 9, 8, 13, 1, 0, 5, 7, 3, 18, 14, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[6], q[3];
cx q[7], q[6];
cx q[6], q[5];
cx q[8], q[2];
cx q[8], q[1];
cx q[13], q[12];
cx q[15], q[13];
cx q[19], q[18];
cx q[19], q[10];
cx q[16], q[17];
cx q[14], q[16];
cx q[14], q[15];
cx q[13], q[14];
cx q[7], q[13];
cx q[13], q[14];
cx q[14], q[13];
cx q[6], q[12];
cx q[12], q[11];
cx q[11], q[9];
