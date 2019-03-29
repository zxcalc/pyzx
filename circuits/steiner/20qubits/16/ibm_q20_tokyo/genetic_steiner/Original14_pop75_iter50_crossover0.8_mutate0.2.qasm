// Initial wiring: [1, 12, 11, 8, 16, 14, 6, 10, 17, 19, 0, 5, 7, 9, 13, 2, 4, 3, 18, 15]
// Resulting wiring: [1, 12, 11, 8, 16, 14, 6, 10, 17, 19, 0, 5, 7, 9, 13, 2, 4, 3, 18, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[2], q[1];
cx q[5], q[4];
cx q[6], q[4];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[2];
cx q[8], q[1];
cx q[14], q[13];
cx q[18], q[17];
cx q[19], q[18];
cx q[18], q[17];
cx q[17], q[12];
cx q[19], q[10];
cx q[12], q[6];
cx q[18], q[11];
cx q[10], q[9];
cx q[17], q[12];
cx q[19], q[18];
