// Initial wiring: [2, 11, 12, 17, 10, 18, 9, 8, 15, 14, 5, 19, 16, 4, 0, 6, 1, 7, 3, 13]
// Resulting wiring: [2, 11, 12, 17, 10, 18, 9, 8, 15, 14, 5, 19, 16, 4, 0, 6, 1, 7, 3, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[4], q[3];
cx q[11], q[9];
cx q[12], q[7];
cx q[12], q[6];
cx q[15], q[14];
cx q[18], q[11];
cx q[11], q[10];
cx q[19], q[10];
cx q[13], q[16];
cx q[16], q[17];
cx q[13], q[14];
cx q[12], q[17];
cx q[11], q[18];
cx q[9], q[11];
cx q[11], q[18];
cx q[18], q[11];
cx q[8], q[10];
