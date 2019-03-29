// Initial wiring: [0, 6, 11, 13, 7, 5, 10, 14, 19, 15, 1, 9, 12, 2, 3, 17, 4, 8, 16, 18]
// Resulting wiring: [0, 6, 11, 13, 7, 5, 10, 14, 19, 15, 1, 9, 12, 2, 3, 17, 4, 8, 16, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[11], q[8];
cx q[12], q[6];
cx q[13], q[6];
cx q[17], q[12];
cx q[19], q[18];
cx q[18], q[12];
cx q[12], q[7];
cx q[19], q[18];
cx q[16], q[17];
cx q[13], q[15];
cx q[6], q[13];
cx q[4], q[6];
cx q[3], q[6];
cx q[6], q[13];
cx q[13], q[6];
cx q[0], q[1];
cx q[1], q[7];
cx q[7], q[13];
cx q[0], q[9];
