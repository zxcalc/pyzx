// Initial wiring: [12, 5, 3, 4, 18, 9, 17, 19, 11, 13, 7, 1, 6, 10, 8, 14, 0, 2, 15, 16]
// Resulting wiring: [12, 5, 3, 4, 18, 9, 17, 19, 11, 13, 7, 1, 6, 10, 8, 14, 0, 2, 15, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[4], q[3];
cx q[5], q[4];
cx q[7], q[6];
cx q[13], q[12];
cx q[13], q[6];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[14], q[13];
cx q[18], q[11];
cx q[19], q[18];
cx q[19], q[10];
cx q[15], q[16];
cx q[11], q[17];
cx q[8], q[10];
cx q[7], q[12];
cx q[5], q[14];
