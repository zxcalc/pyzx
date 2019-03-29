// Initial wiring: [12, 19, 8, 7, 14, 9, 2, 3, 6, 10, 0, 11, 17, 1, 13, 15, 18, 16, 4, 5]
// Resulting wiring: [12, 19, 8, 7, 14, 9, 2, 3, 6, 10, 0, 11, 17, 1, 13, 15, 18, 16, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[8];
cx q[12], q[6];
cx q[13], q[7];
cx q[17], q[16];
cx q[16], q[17];
cx q[12], q[13];
cx q[3], q[4];
cx q[2], q[7];
