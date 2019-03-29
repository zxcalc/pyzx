// Initial wiring: [1, 0, 13, 17, 19, 6, 10, 5, 12, 7, 15, 3, 18, 16, 11, 8, 14, 4, 2, 9]
// Resulting wiring: [1, 0, 13, 17, 19, 6, 10, 5, 12, 7, 15, 3, 18, 16, 11, 8, 14, 4, 2, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[12], q[11];
cx q[12], q[13];
cx q[13], q[16];
cx q[11], q[17];
cx q[4], q[5];
cx q[5], q[14];
cx q[3], q[6];
