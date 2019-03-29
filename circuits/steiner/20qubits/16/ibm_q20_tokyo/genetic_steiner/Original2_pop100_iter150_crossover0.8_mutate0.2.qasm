// Initial wiring: [18, 15, 9, 6, 19, 0, 8, 13, 2, 17, 5, 1, 16, 12, 4, 7, 3, 11, 10, 14]
// Resulting wiring: [18, 15, 9, 6, 19, 0, 8, 13, 2, 17, 5, 1, 16, 12, 4, 7, 3, 11, 10, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[7], q[1];
cx q[8], q[7];
cx q[8], q[1];
cx q[11], q[9];
cx q[13], q[12];
cx q[13], q[7];
cx q[16], q[15];
cx q[16], q[13];
cx q[13], q[15];
cx q[11], q[12];
cx q[7], q[12];
cx q[12], q[18];
cx q[12], q[17];
cx q[5], q[14];
cx q[3], q[6];
cx q[2], q[8];
