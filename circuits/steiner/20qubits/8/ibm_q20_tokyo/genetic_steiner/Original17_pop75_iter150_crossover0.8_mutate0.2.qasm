// Initial wiring: [15, 12, 17, 2, 7, 11, 13, 9, 5, 19, 18, 0, 10, 16, 8, 4, 6, 14, 3, 1]
// Resulting wiring: [15, 12, 17, 2, 7, 11, 13, 9, 5, 19, 18, 0, 10, 16, 8, 4, 6, 14, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[19], q[10];
cx q[14], q[16];
cx q[16], q[17];
cx q[7], q[13];
cx q[4], q[6];
