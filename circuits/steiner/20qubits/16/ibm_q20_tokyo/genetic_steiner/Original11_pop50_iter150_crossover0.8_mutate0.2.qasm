// Initial wiring: [19, 15, 11, 12, 6, 0, 17, 2, 5, 14, 13, 3, 10, 1, 4, 18, 7, 16, 8, 9]
// Resulting wiring: [19, 15, 11, 12, 6, 0, 17, 2, 5, 14, 13, 3, 10, 1, 4, 18, 7, 16, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[10], q[8];
cx q[11], q[8];
cx q[12], q[6];
cx q[14], q[13];
cx q[14], q[5];
cx q[17], q[16];
cx q[18], q[19];
cx q[17], q[18];
cx q[18], q[19];
cx q[13], q[16];
cx q[4], q[5];
cx q[2], q[7];
cx q[1], q[8];
cx q[0], q[9];
cx q[9], q[11];
cx q[9], q[8];
