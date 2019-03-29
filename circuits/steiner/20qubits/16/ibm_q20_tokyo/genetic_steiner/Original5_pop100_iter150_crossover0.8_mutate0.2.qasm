// Initial wiring: [6, 3, 0, 12, 4, 18, 7, 11, 8, 17, 2, 13, 5, 9, 19, 14, 1, 10, 16, 15]
// Resulting wiring: [6, 3, 0, 12, 4, 18, 7, 11, 8, 17, 2, 13, 5, 9, 19, 14, 1, 10, 16, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[4];
cx q[7], q[1];
cx q[8], q[2];
cx q[12], q[6];
cx q[6], q[4];
cx q[14], q[13];
cx q[17], q[12];
cx q[17], q[16];
cx q[12], q[6];
cx q[17], q[11];
cx q[18], q[17];
cx q[18], q[19];
cx q[17], q[18];
cx q[16], q[17];
cx q[17], q[18];
cx q[14], q[16];
cx q[7], q[8];
