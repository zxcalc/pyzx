// Initial wiring: [6, 11, 10, 8, 13, 19, 3, 14, 0, 7, 16, 18, 2, 12, 17, 4, 9, 15, 1, 5]
// Resulting wiring: [6, 11, 10, 8, 13, 19, 3, 14, 0, 7, 16, 18, 2, 12, 17, 4, 9, 15, 1, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[4], q[3];
cx q[7], q[1];
cx q[10], q[8];
cx q[8], q[7];
cx q[14], q[13];
cx q[13], q[7];
cx q[14], q[13];
cx q[17], q[16];
cx q[18], q[12];
cx q[14], q[16];
cx q[8], q[11];
cx q[4], q[6];
cx q[3], q[6];
cx q[6], q[12];
cx q[0], q[1];
