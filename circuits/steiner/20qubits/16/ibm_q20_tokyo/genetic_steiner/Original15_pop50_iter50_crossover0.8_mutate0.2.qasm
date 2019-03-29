// Initial wiring: [16, 12, 3, 8, 14, 1, 18, 7, 13, 9, 17, 19, 0, 2, 4, 10, 6, 5, 15, 11]
// Resulting wiring: [16, 12, 3, 8, 14, 1, 18, 7, 13, 9, 17, 19, 0, 2, 4, 10, 6, 5, 15, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[2], q[1];
cx q[8], q[7];
cx q[9], q[8];
cx q[8], q[1];
cx q[9], q[0];
cx q[9], q[8];
cx q[10], q[8];
cx q[8], q[7];
cx q[10], q[8];
cx q[11], q[9];
cx q[15], q[14];
cx q[17], q[16];
cx q[16], q[14];
cx q[16], q[13];
cx q[15], q[16];
cx q[10], q[11];
cx q[7], q[12];
cx q[7], q[8];
cx q[4], q[6];
cx q[2], q[3];
