// Initial wiring: [5, 3, 10, 18, 0, 12, 9, 15, 2, 14, 11, 17, 1, 19, 13, 4, 7, 16, 6, 8]
// Resulting wiring: [5, 3, 10, 18, 0, 12, 9, 15, 2, 14, 11, 17, 1, 19, 13, 4, 7, 16, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[7], q[1];
cx q[8], q[1];
cx q[12], q[7];
cx q[7], q[1];
cx q[12], q[6];
cx q[12], q[7];
cx q[15], q[13];
cx q[13], q[7];
cx q[15], q[14];
cx q[7], q[2];
cx q[13], q[6];
cx q[16], q[15];
cx q[18], q[12];
cx q[18], q[17];
cx q[12], q[6];
cx q[11], q[17];
cx q[3], q[5];
cx q[2], q[8];
