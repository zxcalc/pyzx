// Initial wiring: [10, 8, 11, 15, 0, 17, 16, 3, 4, 6, 2, 5, 12, 9, 7, 13, 19, 14, 18, 1]
// Resulting wiring: [10, 8, 11, 15, 0, 17, 16, 3, 4, 6, 2, 5, 12, 9, 7, 13, 19, 14, 18, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[11], q[9];
cx q[12], q[6];
cx q[13], q[6];
cx q[14], q[5];
cx q[5], q[4];
cx q[14], q[5];
cx q[15], q[13];
cx q[13], q[12];
cx q[15], q[13];
cx q[16], q[13];
cx q[17], q[18];
cx q[14], q[16];
cx q[9], q[10];
cx q[7], q[12];
cx q[5], q[14];
cx q[14], q[16];
cx q[14], q[15];
cx q[0], q[9];
cx q[9], q[8];
