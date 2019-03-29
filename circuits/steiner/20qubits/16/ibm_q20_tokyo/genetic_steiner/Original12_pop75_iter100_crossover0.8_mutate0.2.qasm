// Initial wiring: [6, 2, 17, 10, 19, 13, 4, 15, 7, 0, 18, 3, 14, 9, 12, 11, 5, 8, 1, 16]
// Resulting wiring: [6, 2, 17, 10, 19, 13, 4, 15, 7, 0, 18, 3, 14, 9, 12, 11, 5, 8, 1, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[6], q[5];
cx q[6], q[3];
cx q[12], q[7];
cx q[18], q[12];
cx q[18], q[11];
cx q[14], q[15];
cx q[13], q[16];
cx q[9], q[11];
cx q[8], q[11];
cx q[7], q[8];
cx q[8], q[11];
cx q[6], q[13];
cx q[13], q[16];
cx q[16], q[17];
cx q[2], q[8];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[5];
