// Initial wiring: [12, 2, 19, 9, 4, 0, 5, 1, 16, 15, 18, 7, 10, 6, 8, 17, 3, 11, 13, 14]
// Resulting wiring: [12, 2, 19, 9, 4, 0, 5, 1, 16, 15, 18, 7, 10, 6, 8, 17, 3, 11, 13, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[11], q[10];
cx q[12], q[7];
cx q[12], q[6];
cx q[14], q[5];
cx q[16], q[14];
cx q[16], q[13];
cx q[17], q[16];
cx q[16], q[14];
cx q[17], q[11];
cx q[12], q[18];
cx q[11], q[12];
cx q[8], q[11];
cx q[11], q[12];
cx q[8], q[9];
cx q[12], q[11];
cx q[7], q[12];
cx q[7], q[8];
cx q[2], q[7];
cx q[2], q[3];
