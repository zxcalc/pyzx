// Initial wiring: [2, 14, 1, 19, 7, 16, 13, 5, 15, 12, 11, 6, 4, 9, 18, 17, 3, 10, 8, 0]
// Resulting wiring: [2, 14, 1, 19, 7, 16, 13, 5, 15, 12, 11, 6, 4, 9, 18, 17, 3, 10, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[6];
cx q[15], q[13];
cx q[13], q[6];
cx q[16], q[13];
cx q[8], q[11];
cx q[3], q[6];
cx q[3], q[4];
cx q[1], q[2];
