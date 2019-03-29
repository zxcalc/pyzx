// Initial wiring: [7, 10, 13, 15, 2, 4, 18, 8, 11, 14, 3, 9, 0, 17, 1, 16, 12, 6, 5, 19]
// Resulting wiring: [7, 10, 13, 15, 2, 4, 18, 8, 11, 14, 3, 9, 0, 17, 1, 16, 12, 6, 5, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[6], q[4];
cx q[8], q[2];
cx q[10], q[8];
cx q[8], q[1];
cx q[12], q[6];
cx q[17], q[12];
cx q[12], q[6];
cx q[6], q[4];
cx q[17], q[11];
cx q[18], q[11];
cx q[19], q[18];
cx q[18], q[12];
cx q[12], q[7];
cx q[14], q[16];
cx q[13], q[16];
cx q[11], q[17];
cx q[8], q[11];
cx q[11], q[17];
cx q[8], q[10];
cx q[17], q[11];
cx q[3], q[5];
