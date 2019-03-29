// Initial wiring: [4, 14, 3, 17, 19, 9, 15, 1, 0, 8, 5, 2, 16, 18, 6, 12, 10, 7, 13, 11]
// Resulting wiring: [4, 14, 3, 17, 19, 9, 15, 1, 0, 8, 5, 2, 16, 18, 6, 12, 10, 7, 13, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[5], q[4];
cx q[6], q[4];
cx q[9], q[8];
cx q[11], q[8];
cx q[15], q[13];
cx q[13], q[12];
cx q[13], q[6];
cx q[15], q[13];
cx q[16], q[13];
cx q[13], q[6];
cx q[16], q[14];
cx q[16], q[13];
cx q[18], q[17];
cx q[14], q[15];
cx q[9], q[11];
cx q[11], q[12];
cx q[7], q[8];
cx q[6], q[12];
cx q[1], q[8];
cx q[0], q[9];
