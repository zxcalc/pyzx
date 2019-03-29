// Initial wiring: [13, 9, 16, 14, 2, 17, 10, 6, 3, 18, 5, 8, 11, 7, 1, 4, 19, 12, 0, 15]
// Resulting wiring: [13, 9, 16, 14, 2, 17, 10, 6, 3, 18, 5, 8, 11, 7, 1, 4, 19, 12, 0, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[7], q[2];
cx q[10], q[8];
cx q[13], q[7];
cx q[14], q[5];
cx q[16], q[14];
cx q[14], q[5];
cx q[17], q[16];
cx q[16], q[14];
cx q[19], q[18];
cx q[19], q[10];
cx q[18], q[17];
cx q[10], q[8];
cx q[17], q[16];
cx q[8], q[7];
cx q[18], q[17];
cx q[9], q[10];
cx q[6], q[12];
cx q[5], q[6];
cx q[6], q[12];
cx q[12], q[17];
cx q[6], q[7];
cx q[0], q[1];
