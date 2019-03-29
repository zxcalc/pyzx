// Initial wiring: [9, 16, 8, 2, 11, 5, 13, 7, 10, 17, 12, 6, 1, 15, 14, 3, 19, 0, 4, 18]
// Resulting wiring: [9, 16, 8, 2, 11, 5, 13, 7, 10, 17, 12, 6, 1, 15, 14, 3, 19, 0, 4, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[4], q[3];
cx q[13], q[6];
cx q[6], q[5];
cx q[13], q[6];
cx q[15], q[14];
cx q[14], q[5];
cx q[15], q[14];
cx q[16], q[14];
cx q[14], q[5];
cx q[18], q[12];
cx q[18], q[17];
cx q[12], q[7];
cx q[14], q[15];
cx q[11], q[17];
cx q[8], q[9];
cx q[1], q[7];
cx q[1], q[2];
