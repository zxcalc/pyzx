// Initial wiring: [14, 9, 0, 8, 4, 11, 5, 19, 13, 10, 2, 16, 1, 7, 18, 12, 3, 6, 15, 17]
// Resulting wiring: [14, 9, 0, 8, 4, 11, 5, 19, 13, 10, 2, 16, 1, 7, 18, 12, 3, 6, 15, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[5], q[3];
cx q[6], q[4];
cx q[7], q[1];
cx q[9], q[8];
cx q[12], q[11];
cx q[13], q[6];
cx q[16], q[17];
cx q[13], q[14];
cx q[12], q[18];
cx q[12], q[13];
cx q[11], q[18];
cx q[11], q[12];
cx q[9], q[11];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[16];
cx q[11], q[9];
cx q[7], q[12];
cx q[6], q[13];
cx q[5], q[6];
cx q[6], q[13];
cx q[13], q[16];
cx q[13], q[6];
