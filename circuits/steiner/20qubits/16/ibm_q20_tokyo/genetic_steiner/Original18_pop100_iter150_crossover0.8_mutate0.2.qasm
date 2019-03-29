// Initial wiring: [9, 4, 8, 2, 1, 11, 0, 14, 3, 19, 5, 15, 16, 12, 7, 13, 6, 10, 18, 17]
// Resulting wiring: [9, 4, 8, 2, 1, 11, 0, 14, 3, 19, 5, 15, 16, 12, 7, 13, 6, 10, 18, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[7], q[6];
cx q[11], q[9];
cx q[12], q[11];
cx q[13], q[12];
cx q[12], q[11];
cx q[15], q[14];
cx q[17], q[16];
cx q[16], q[13];
cx q[17], q[11];
cx q[18], q[12];
cx q[11], q[12];
cx q[4], q[6];
cx q[6], q[12];
cx q[2], q[3];
cx q[3], q[6];
cx q[6], q[12];
cx q[1], q[2];
cx q[0], q[9];
