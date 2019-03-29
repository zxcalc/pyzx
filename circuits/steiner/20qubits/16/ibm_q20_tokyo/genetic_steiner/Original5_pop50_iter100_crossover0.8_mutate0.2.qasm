// Initial wiring: [17, 14, 9, 19, 2, 13, 1, 11, 8, 0, 6, 3, 7, 10, 15, 12, 16, 18, 5, 4]
// Resulting wiring: [17, 14, 9, 19, 2, 13, 1, 11, 8, 0, 6, 3, 7, 10, 15, 12, 16, 18, 5, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[6], q[5];
cx q[11], q[10];
cx q[13], q[6];
cx q[13], q[12];
cx q[6], q[5];
cx q[16], q[14];
cx q[16], q[13];
cx q[18], q[19];
cx q[17], q[18];
cx q[13], q[16];
cx q[16], q[17];
cx q[17], q[18];
cx q[12], q[17];
cx q[8], q[11];
cx q[8], q[9];
cx q[7], q[8];
cx q[7], q[12];
cx q[8], q[11];
cx q[6], q[13];
cx q[13], q[16];
cx q[3], q[6];
