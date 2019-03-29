// Initial wiring: [13, 3, 8, 6, 12, 2, 5, 0, 16, 14, 4, 9, 7, 11, 10, 15, 18, 1, 17, 19]
// Resulting wiring: [13, 3, 8, 6, 12, 2, 5, 0, 16, 14, 4, 9, 7, 11, 10, 15, 18, 1, 17, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[10], q[9];
cx q[10], q[8];
cx q[13], q[12];
cx q[13], q[7];
cx q[14], q[5];
cx q[18], q[11];
cx q[11], q[10];
cx q[18], q[11];
cx q[19], q[18];
cx q[15], q[16];
cx q[13], q[16];
cx q[10], q[19];
cx q[7], q[8];
cx q[2], q[3];
cx q[0], q[9];
cx q[0], q[1];
