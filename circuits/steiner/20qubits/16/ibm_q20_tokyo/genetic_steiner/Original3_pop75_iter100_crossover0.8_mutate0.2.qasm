// Initial wiring: [12, 15, 18, 11, 7, 16, 2, 8, 6, 3, 13, 14, 4, 10, 0, 1, 5, 19, 17, 9]
// Resulting wiring: [12, 15, 18, 11, 7, 16, 2, 8, 6, 3, 13, 14, 4, 10, 0, 1, 5, 19, 17, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[6], q[5];
cx q[10], q[9];
cx q[12], q[6];
cx q[6], q[5];
cx q[12], q[11];
cx q[12], q[6];
cx q[13], q[6];
cx q[14], q[5];
cx q[19], q[18];
cx q[18], q[12];
cx q[19], q[18];
cx q[17], q[18];
cx q[14], q[16];
cx q[12], q[17];
cx q[10], q[11];
cx q[7], q[8];
cx q[5], q[14];
cx q[3], q[5];
cx q[5], q[14];
cx q[3], q[4];
cx q[1], q[2];
