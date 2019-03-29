// Initial wiring: [14, 19, 15, 10, 2, 13, 11, 8, 3, 4, 1, 12, 9, 17, 7, 16, 18, 5, 0, 6]
// Resulting wiring: [14, 19, 15, 10, 2, 13, 11, 8, 3, 4, 1, 12, 9, 17, 7, 16, 18, 5, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[2], q[1];
cx q[5], q[4];
cx q[8], q[7];
cx q[13], q[6];
cx q[15], q[13];
cx q[13], q[7];
cx q[15], q[13];
cx q[17], q[11];
cx q[17], q[12];
cx q[11], q[10];
cx q[16], q[17];
cx q[11], q[18];
cx q[6], q[12];
cx q[12], q[6];
cx q[5], q[6];
cx q[6], q[12];
cx q[12], q[6];
cx q[2], q[3];
cx q[3], q[6];
cx q[6], q[12];
