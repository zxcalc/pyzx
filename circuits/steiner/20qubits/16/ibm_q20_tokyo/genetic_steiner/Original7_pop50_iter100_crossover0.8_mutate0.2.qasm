// Initial wiring: [11, 7, 1, 2, 12, 8, 3, 16, 15, 10, 19, 6, 17, 4, 9, 5, 18, 14, 0, 13]
// Resulting wiring: [11, 7, 1, 2, 12, 8, 3, 16, 15, 10, 19, 6, 17, 4, 9, 5, 18, 14, 0, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[5], q[3];
cx q[3], q[2];
cx q[5], q[3];
cx q[7], q[1];
cx q[11], q[8];
cx q[8], q[2];
cx q[11], q[8];
cx q[13], q[6];
cx q[14], q[5];
cx q[16], q[13];
cx q[17], q[18];
cx q[14], q[16];
cx q[11], q[12];
cx q[10], q[11];
cx q[9], q[11];
cx q[11], q[12];
cx q[7], q[8];
cx q[2], q[3];
cx q[0], q[1];
