// Initial wiring: [5, 4, 16, 11, 17, 6, 12, 18, 8, 1, 2, 0, 19, 15, 13, 10, 7, 9, 14, 3]
// Resulting wiring: [5, 4, 16, 11, 17, 6, 12, 18, 8, 1, 2, 0, 19, 15, 13, 10, 7, 9, 14, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[8];
cx q[8], q[2];
cx q[10], q[8];
cx q[13], q[12];
cx q[14], q[5];
cx q[15], q[13];
cx q[15], q[14];
cx q[13], q[7];
cx q[14], q[5];
cx q[7], q[2];
cx q[13], q[7];
cx q[15], q[14];
cx q[17], q[12];
cx q[19], q[18];
cx q[18], q[11];
cx q[14], q[16];
cx q[10], q[11];
cx q[9], q[11];
cx q[8], q[11];
cx q[8], q[10];
cx q[6], q[13];
cx q[5], q[6];
cx q[1], q[8];
