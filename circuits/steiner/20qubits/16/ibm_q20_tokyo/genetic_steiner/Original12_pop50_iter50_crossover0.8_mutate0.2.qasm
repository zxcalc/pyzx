// Initial wiring: [8, 0, 6, 1, 12, 11, 14, 3, 2, 10, 5, 13, 19, 15, 16, 18, 7, 17, 9, 4]
// Resulting wiring: [8, 0, 6, 1, 12, 11, 14, 3, 2, 10, 5, 13, 19, 15, 16, 18, 7, 17, 9, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[9], q[0];
cx q[13], q[7];
cx q[17], q[16];
cx q[18], q[12];
cx q[18], q[11];
cx q[19], q[10];
cx q[19], q[18];
cx q[10], q[9];
cx q[18], q[12];
cx q[18], q[11];
cx q[9], q[0];
cx q[11], q[12];
cx q[9], q[11];
cx q[11], q[17];
cx q[8], q[11];
cx q[11], q[17];
cx q[8], q[9];
cx q[6], q[13];
cx q[13], q[16];
cx q[4], q[5];
cx q[3], q[6];
cx q[6], q[7];
cx q[1], q[7];
