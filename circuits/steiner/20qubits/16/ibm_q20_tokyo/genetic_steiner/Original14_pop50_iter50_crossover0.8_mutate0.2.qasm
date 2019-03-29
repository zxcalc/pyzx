// Initial wiring: [8, 1, 2, 14, 16, 7, 6, 11, 12, 9, 13, 5, 3, 10, 17, 19, 0, 15, 18, 4]
// Resulting wiring: [8, 1, 2, 14, 16, 7, 6, 11, 12, 9, 13, 5, 3, 10, 17, 19, 0, 15, 18, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[8], q[1];
cx q[10], q[9];
cx q[13], q[7];
cx q[14], q[13];
cx q[15], q[13];
cx q[15], q[14];
cx q[13], q[7];
cx q[13], q[6];
cx q[17], q[16];
cx q[17], q[12];
cx q[16], q[15];
cx q[12], q[6];
cx q[17], q[11];
cx q[18], q[11];
cx q[7], q[8];
cx q[5], q[6];
cx q[3], q[4];
