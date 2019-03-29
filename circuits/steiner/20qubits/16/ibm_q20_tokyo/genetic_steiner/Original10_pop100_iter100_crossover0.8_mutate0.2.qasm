// Initial wiring: [17, 6, 13, 5, 1, 16, 12, 14, 2, 3, 15, 0, 11, 10, 4, 18, 8, 7, 19, 9]
// Resulting wiring: [17, 6, 13, 5, 1, 16, 12, 14, 2, 3, 15, 0, 11, 10, 4, 18, 8, 7, 19, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[8], q[1];
cx q[1], q[0];
cx q[11], q[8];
cx q[11], q[10];
cx q[8], q[1];
cx q[13], q[6];
cx q[15], q[13];
cx q[16], q[13];
cx q[13], q[6];
cx q[17], q[11];
cx q[11], q[8];
cx q[17], q[11];
cx q[18], q[12];
cx q[19], q[18];
cx q[14], q[16];
cx q[6], q[13];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[2], q[8];
cx q[1], q[8];
cx q[1], q[7];
