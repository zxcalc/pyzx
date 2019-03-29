// Initial wiring: [7, 11, 6, 3, 16, 18, 8, 9, 10, 15, 19, 2, 17, 1, 5, 4, 12, 0, 13, 14]
// Resulting wiring: [7, 11, 6, 3, 16, 18, 8, 9, 10, 15, 19, 2, 17, 1, 5, 4, 12, 0, 13, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[8], q[7];
cx q[12], q[7];
cx q[12], q[6];
cx q[13], q[7];
cx q[14], q[13];
cx q[13], q[7];
cx q[7], q[1];
cx q[16], q[13];
cx q[18], q[12];
cx q[12], q[7];
cx q[18], q[11];
cx q[18], q[12];
cx q[14], q[16];
cx q[16], q[17];
cx q[10], q[19];
cx q[9], q[10];
cx q[5], q[14];
cx q[4], q[6];
cx q[3], q[6];
