// Initial wiring: [1, 5, 12, 0, 14, 17, 11, 4, 3, 13, 2, 6, 19, 9, 8, 10, 15, 18, 16, 7]
// Resulting wiring: [1, 5, 12, 0, 14, 17, 11, 4, 3, 13, 2, 6, 19, 9, 8, 10, 15, 18, 16, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[3], q[2];
cx q[7], q[6];
cx q[7], q[1];
cx q[8], q[2];
cx q[14], q[5];
cx q[16], q[13];
cx q[13], q[6];
cx q[17], q[11];
cx q[18], q[11];
cx q[12], q[17];
cx q[8], q[10];
cx q[3], q[6];
cx q[2], q[7];
