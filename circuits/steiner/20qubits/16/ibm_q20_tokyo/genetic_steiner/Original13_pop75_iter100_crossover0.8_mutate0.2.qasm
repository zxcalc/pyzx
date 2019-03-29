// Initial wiring: [15, 2, 9, 1, 7, 14, 0, 17, 12, 5, 11, 18, 4, 19, 3, 13, 16, 6, 10, 8]
// Resulting wiring: [15, 2, 9, 1, 7, 14, 0, 17, 12, 5, 11, 18, 4, 19, 3, 13, 16, 6, 10, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[5], q[3];
cx q[6], q[4];
cx q[8], q[7];
cx q[7], q[6];
cx q[12], q[11];
cx q[13], q[7];
cx q[13], q[6];
cx q[15], q[13];
cx q[17], q[16];
cx q[16], q[13];
cx q[13], q[7];
cx q[18], q[17];
cx q[15], q[16];
cx q[10], q[19];
cx q[8], q[11];
cx q[5], q[6];
cx q[2], q[7];
cx q[7], q[6];
cx q[1], q[7];
