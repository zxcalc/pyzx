// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[6];
cx q[11], q[1];
cx q[11], q[4];
cx q[15], q[1];
cx q[15], q[6];
cx q[13], q[7];
cx q[15], q[11];
cx q[12], q[16];
cx q[9], q[19];
cx q[1], q[4];
cx q[1], q[6];
