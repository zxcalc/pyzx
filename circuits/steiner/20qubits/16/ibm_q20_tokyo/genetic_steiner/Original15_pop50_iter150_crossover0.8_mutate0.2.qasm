// Initial wiring: [10, 2, 6, 5, 15, 1, 0, 4, 16, 11, 8, 9, 17, 7, 14, 18, 13, 12, 19, 3]
// Resulting wiring: [10, 2, 6, 5, 15, 1, 0, 4, 16, 11, 8, 9, 17, 7, 14, 18, 13, 12, 19, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[12], q[6];
cx q[13], q[6];
cx q[17], q[11];
cx q[11], q[8];
cx q[17], q[11];
cx q[18], q[11];
cx q[19], q[18];
cx q[18], q[17];
cx q[19], q[10];
cx q[19], q[18];
cx q[16], q[17];
cx q[14], q[15];
cx q[12], q[13];
cx q[12], q[18];
cx q[13], q[16];
cx q[11], q[17];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[7];
cx q[2], q[1];
