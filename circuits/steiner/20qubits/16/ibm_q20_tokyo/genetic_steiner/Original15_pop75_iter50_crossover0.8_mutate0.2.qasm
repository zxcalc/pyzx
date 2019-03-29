// Initial wiring: [15, 14, 18, 3, 16, 8, 12, 9, 10, 5, 1, 6, 13, 7, 17, 0, 19, 2, 4, 11]
// Resulting wiring: [15, 14, 18, 3, 16, 8, 12, 9, 10, 5, 1, 6, 13, 7, 17, 0, 19, 2, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[6], q[4];
cx q[12], q[6];
cx q[14], q[13];
cx q[13], q[12];
cx q[13], q[7];
cx q[16], q[13];
cx q[13], q[7];
cx q[16], q[13];
cx q[14], q[16];
cx q[13], q[15];
cx q[9], q[11];
cx q[11], q[17];
cx q[8], q[11];
cx q[11], q[18];
cx q[3], q[6];
cx q[3], q[5];
cx q[1], q[2];
