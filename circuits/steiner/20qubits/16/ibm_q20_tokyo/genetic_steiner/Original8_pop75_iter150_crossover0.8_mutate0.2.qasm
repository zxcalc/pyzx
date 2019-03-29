// Initial wiring: [13, 19, 0, 17, 5, 11, 16, 9, 4, 18, 12, 7, 6, 15, 10, 2, 3, 1, 14, 8]
// Resulting wiring: [13, 19, 0, 17, 5, 11, 16, 9, 4, 18, 12, 7, 6, 15, 10, 2, 3, 1, 14, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[7], q[2];
cx q[8], q[1];
cx q[1], q[0];
cx q[11], q[8];
cx q[12], q[7];
cx q[12], q[6];
cx q[17], q[16];
cx q[15], q[16];
cx q[14], q[15];
cx q[12], q[17];
cx q[9], q[10];
cx q[7], q[13];
cx q[3], q[6];
cx q[1], q[7];
cx q[7], q[13];
cx q[13], q[15];
cx q[13], q[14];
