// Initial wiring: [4, 9, 6, 12, 15, 5, 18, 11, 14, 2, 17, 8, 16, 13, 19, 3, 7, 10, 0, 1]
// Resulting wiring: [4, 9, 6, 12, 15, 5, 18, 11, 14, 2, 17, 8, 16, 13, 19, 3, 7, 10, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[10], q[8];
cx q[8], q[7];
cx q[11], q[10];
cx q[17], q[16];
cx q[16], q[15];
cx q[16], q[13];
cx q[18], q[17];
cx q[18], q[12];
cx q[18], q[11];
cx q[19], q[18];
cx q[13], q[16];
cx q[13], q[15];
cx q[12], q[18];
cx q[9], q[11];
cx q[9], q[10];
cx q[8], q[11];
cx q[7], q[12];
cx q[12], q[18];
cx q[7], q[13];
cx q[18], q[12];
