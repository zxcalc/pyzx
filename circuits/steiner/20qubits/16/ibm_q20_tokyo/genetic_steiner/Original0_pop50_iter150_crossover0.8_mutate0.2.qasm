// Initial wiring: [2, 1, 19, 0, 16, 15, 18, 11, 6, 3, 4, 10, 8, 14, 9, 17, 12, 5, 13, 7]
// Resulting wiring: [2, 1, 19, 0, 16, 15, 18, 11, 6, 3, 4, 10, 8, 14, 9, 17, 12, 5, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[4], q[3];
cx q[8], q[7];
cx q[11], q[9];
cx q[12], q[11];
cx q[11], q[9];
cx q[9], q[0];
cx q[13], q[7];
cx q[15], q[14];
cx q[15], q[13];
cx q[16], q[13];
cx q[18], q[12];
cx q[6], q[13];
cx q[5], q[14];
cx q[3], q[6];
cx q[6], q[13];
