// Initial wiring: [17, 11, 1, 13, 9, 19, 7, 0, 16, 6, 2, 4, 5, 3, 12, 18, 15, 14, 10, 8]
// Resulting wiring: [17, 11, 1, 13, 9, 19, 7, 0, 16, 6, 2, 4, 5, 3, 12, 18, 15, 14, 10, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[8], q[1];
cx q[11], q[8];
cx q[11], q[10];
cx q[8], q[2];
cx q[12], q[6];
cx q[14], q[5];
cx q[18], q[17];
cx q[18], q[19];
cx q[14], q[16];
cx q[13], q[15];
cx q[12], q[13];
cx q[11], q[12];
cx q[6], q[7];
cx q[2], q[3];
cx q[3], q[4];
