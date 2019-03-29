// Initial wiring: [18, 13, 8, 2, 15, 0, 3, 19, 6, 7, 14, 1, 4, 5, 9, 10, 12, 16, 17, 11]
// Resulting wiring: [18, 13, 8, 2, 15, 0, 3, 19, 6, 7, 14, 1, 4, 5, 9, 10, 12, 16, 17, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[6], q[3];
cx q[7], q[6];
cx q[11], q[8];
cx q[16], q[14];
cx q[18], q[17];
cx q[18], q[11];
cx q[17], q[16];
cx q[11], q[8];
cx q[16], q[13];
cx q[8], q[7];
cx q[17], q[16];
cx q[15], q[16];
cx q[14], q[15];
cx q[11], q[12];
cx q[7], q[8];
cx q[6], q[12];
cx q[4], q[5];
