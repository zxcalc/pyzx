// Initial wiring: [12, 9, 5, 0, 18, 7, 16, 14, 4, 17, 10, 19, 8, 13, 15, 11, 3, 1, 6, 2]
// Resulting wiring: [12, 9, 5, 0, 18, 7, 16, 14, 4, 17, 10, 19, 8, 13, 15, 11, 3, 1, 6, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[5], q[3];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[9], q[8];
cx q[11], q[9];
cx q[13], q[7];
cx q[14], q[5];
cx q[5], q[4];
cx q[15], q[14];
cx q[14], q[5];
cx q[5], q[4];
cx q[5], q[3];
cx q[15], q[14];
cx q[13], q[16];
cx q[12], q[18];
cx q[10], q[19];
cx q[3], q[6];
cx q[1], q[8];
cx q[8], q[11];
