// Initial wiring: [6, 0, 9, 12, 5, 18, 1, 13, 11, 16, 17, 8, 2, 10, 15, 14, 19, 3, 7, 4]
// Resulting wiring: [6, 0, 9, 12, 5, 18, 1, 13, 11, 16, 17, 8, 2, 10, 15, 14, 19, 3, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[2], q[1];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[5], q[4];
cx q[10], q[8];
cx q[14], q[13];
cx q[13], q[7];
cx q[7], q[2];
cx q[13], q[7];
cx q[16], q[15];
cx q[17], q[11];
cx q[14], q[16];
cx q[10], q[11];
cx q[9], q[11];
cx q[7], q[12];
cx q[7], q[8];
cx q[3], q[6];
cx q[2], q[8];
