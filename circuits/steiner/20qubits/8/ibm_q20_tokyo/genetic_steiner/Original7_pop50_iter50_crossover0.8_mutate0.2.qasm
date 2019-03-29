// Initial wiring: [3, 9, 15, 17, 8, 2, 18, 14, 5, 7, 4, 16, 11, 19, 10, 1, 13, 6, 12, 0]
// Resulting wiring: [3, 9, 15, 17, 8, 2, 18, 14, 5, 7, 4, 16, 11, 19, 10, 1, 13, 6, 12, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[8], q[2];
cx q[14], q[16];
cx q[16], q[17];
cx q[17], q[16];
cx q[13], q[16];
cx q[12], q[17];
cx q[17], q[16];
cx q[1], q[2];
