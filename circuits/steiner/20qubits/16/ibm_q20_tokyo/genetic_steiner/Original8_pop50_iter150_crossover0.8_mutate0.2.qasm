// Initial wiring: [8, 3, 1, 11, 5, 17, 16, 6, 2, 14, 10, 15, 19, 9, 18, 0, 12, 13, 4, 7]
// Resulting wiring: [8, 3, 1, 11, 5, 17, 16, 6, 2, 14, 10, 15, 19, 9, 18, 0, 12, 13, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[7], q[6];
cx q[7], q[2];
cx q[8], q[1];
cx q[10], q[8];
cx q[12], q[11];
cx q[18], q[11];
cx q[18], q[17];
cx q[18], q[12];
cx q[11], q[10];
cx q[11], q[8];
cx q[19], q[18];
cx q[14], q[16];
cx q[13], q[15];
cx q[12], q[13];
cx q[7], q[13];
cx q[5], q[6];
