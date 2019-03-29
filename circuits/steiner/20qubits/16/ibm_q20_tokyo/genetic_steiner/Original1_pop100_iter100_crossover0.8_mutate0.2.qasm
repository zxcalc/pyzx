// Initial wiring: [7, 13, 17, 12, 8, 1, 0, 9, 11, 3, 10, 2, 6, 5, 19, 15, 4, 18, 16, 14]
// Resulting wiring: [7, 13, 17, 12, 8, 1, 0, 9, 11, 3, 10, 2, 6, 5, 19, 15, 4, 18, 16, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[8], q[1];
cx q[9], q[8];
cx q[12], q[6];
cx q[13], q[7];
cx q[14], q[13];
cx q[13], q[6];
cx q[6], q[4];
cx q[17], q[16];
cx q[15], q[16];
cx q[12], q[17];
cx q[11], q[12];
cx q[8], q[11];
cx q[11], q[12];
cx q[8], q[10];
cx q[8], q[9];
cx q[12], q[11];
cx q[2], q[3];
