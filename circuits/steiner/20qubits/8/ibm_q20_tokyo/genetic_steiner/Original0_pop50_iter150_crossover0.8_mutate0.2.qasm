// Initial wiring: [1, 0, 14, 7, 15, 12, 10, 16, 13, 11, 6, 9, 17, 18, 2, 8, 3, 4, 5, 19]
// Resulting wiring: [1, 0, 14, 7, 15, 12, 10, 16, 13, 11, 6, 9, 17, 18, 2, 8, 3, 4, 5, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[12], q[6];
cx q[13], q[7];
cx q[7], q[2];
cx q[19], q[10];
cx q[10], q[9];
cx q[13], q[16];
cx q[16], q[17];
