// Initial wiring: [0, 1, 6, 8, 5, 3, 9, 2, 17, 14, 10, 19, 15, 18, 4, 11, 7, 16, 12, 13]
// Resulting wiring: [0, 1, 6, 8, 5, 3, 9, 2, 17, 14, 10, 19, 15, 18, 4, 11, 7, 16, 12, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[2];
cx q[6], q[3];
cx q[7], q[1];
cx q[8], q[2];
cx q[9], q[0];
cx q[10], q[8];
cx q[11], q[8];
cx q[8], q[2];
cx q[12], q[7];
cx q[7], q[1];
cx q[12], q[7];
cx q[14], q[5];
cx q[17], q[16];
cx q[17], q[12];
cx q[15], q[16];
cx q[13], q[14];
cx q[6], q[13];
cx q[1], q[7];
