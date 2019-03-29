// Initial wiring: [17, 1, 16, 10, 19, 9, 15, 7, 11, 18, 8, 6, 4, 13, 2, 3, 12, 14, 0, 5]
// Resulting wiring: [17, 1, 16, 10, 19, 9, 15, 7, 11, 18, 8, 6, 4, 13, 2, 3, 12, 14, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[7], q[2];
cx q[14], q[13];
cx q[13], q[7];
cx q[7], q[2];
cx q[13], q[6];
cx q[16], q[13];
cx q[13], q[7];
cx q[18], q[11];
cx q[18], q[12];
cx q[11], q[10];
cx q[15], q[16];
cx q[5], q[14];
cx q[2], q[8];
cx q[1], q[2];
cx q[1], q[8];
cx q[2], q[3];
