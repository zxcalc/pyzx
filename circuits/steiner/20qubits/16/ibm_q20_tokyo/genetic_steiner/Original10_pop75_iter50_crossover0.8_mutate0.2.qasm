// Initial wiring: [3, 18, 15, 9, 11, 19, 17, 12, 0, 6, 5, 14, 2, 10, 4, 8, 16, 1, 13, 7]
// Resulting wiring: [3, 18, 15, 9, 11, 19, 17, 12, 0, 6, 5, 14, 2, 10, 4, 8, 16, 1, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[8], q[2];
cx q[12], q[6];
cx q[13], q[7];
cx q[15], q[13];
cx q[16], q[13];
cx q[13], q[7];
cx q[19], q[18];
cx q[18], q[12];
cx q[19], q[18];
cx q[14], q[15];
cx q[9], q[11];
cx q[8], q[11];
cx q[11], q[12];
cx q[8], q[9];
cx q[12], q[11];
cx q[7], q[13];
cx q[3], q[5];
cx q[1], q[7];
cx q[7], q[12];
cx q[12], q[11];
