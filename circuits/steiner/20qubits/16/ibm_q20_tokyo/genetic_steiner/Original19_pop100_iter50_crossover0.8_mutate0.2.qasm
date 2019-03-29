// Initial wiring: [14, 18, 9, 8, 6, 13, 2, 16, 10, 4, 17, 19, 1, 15, 7, 0, 5, 11, 12, 3]
// Resulting wiring: [14, 18, 9, 8, 6, 13, 2, 16, 10, 4, 17, 19, 1, 15, 7, 0, 5, 11, 12, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[5], q[4];
cx q[9], q[0];
cx q[12], q[11];
cx q[11], q[9];
cx q[16], q[15];
cx q[17], q[16];
cx q[16], q[15];
cx q[17], q[16];
cx q[18], q[11];
cx q[18], q[12];
cx q[11], q[9];
cx q[14], q[15];
cx q[13], q[16];
cx q[12], q[17];
cx q[12], q[13];
cx q[8], q[11];
cx q[8], q[10];
cx q[3], q[6];
cx q[0], q[1];
cx q[1], q[8];
