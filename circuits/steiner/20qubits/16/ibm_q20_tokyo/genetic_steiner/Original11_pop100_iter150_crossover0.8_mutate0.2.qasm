// Initial wiring: [15, 5, 13, 3, 19, 17, 14, 9, 11, 2, 12, 1, 7, 16, 10, 8, 6, 0, 4, 18]
// Resulting wiring: [15, 5, 13, 3, 19, 17, 14, 9, 11, 2, 12, 1, 7, 16, 10, 8, 6, 0, 4, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[2];
cx q[6], q[3];
cx q[13], q[12];
cx q[13], q[7];
cx q[14], q[5];
cx q[18], q[17];
cx q[18], q[11];
cx q[16], q[17];
cx q[13], q[15];
cx q[11], q[12];
cx q[8], q[9];
cx q[4], q[6];
cx q[0], q[1];
