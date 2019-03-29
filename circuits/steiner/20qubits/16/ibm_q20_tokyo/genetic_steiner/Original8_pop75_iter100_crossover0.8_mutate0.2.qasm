// Initial wiring: [11, 14, 12, 16, 17, 6, 9, 0, 18, 8, 5, 13, 19, 3, 1, 2, 10, 15, 4, 7]
// Resulting wiring: [11, 14, 12, 16, 17, 6, 9, 0, 18, 8, 5, 13, 19, 3, 1, 2, 10, 15, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[5], q[3];
cx q[8], q[2];
cx q[14], q[13];
cx q[15], q[13];
cx q[18], q[12];
cx q[12], q[7];
cx q[12], q[6];
cx q[18], q[11];
cx q[19], q[18];
cx q[12], q[17];
cx q[17], q[16];
cx q[16], q[15];
cx q[6], q[7];
cx q[5], q[14];
cx q[5], q[6];
