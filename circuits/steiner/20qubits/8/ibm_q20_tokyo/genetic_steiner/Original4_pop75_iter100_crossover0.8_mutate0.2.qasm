// Initial wiring: [18, 12, 6, 4, 16, 10, 15, 9, 0, 17, 11, 13, 2, 1, 5, 19, 3, 8, 14, 7]
// Resulting wiring: [18, 12, 6, 4, 16, 10, 15, 9, 0, 17, 11, 13, 2, 1, 5, 19, 3, 8, 14, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[12], q[6];
cx q[15], q[16];
cx q[13], q[16];
cx q[12], q[17];
cx q[10], q[19];
cx q[8], q[11];
cx q[0], q[1];
