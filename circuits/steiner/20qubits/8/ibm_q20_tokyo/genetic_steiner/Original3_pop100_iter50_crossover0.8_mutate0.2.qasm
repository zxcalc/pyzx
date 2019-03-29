// Initial wiring: [15, 17, 1, 3, 11, 13, 2, 19, 14, 7, 10, 4, 6, 5, 0, 16, 9, 12, 8, 18]
// Resulting wiring: [15, 17, 1, 3, 11, 13, 2, 19, 14, 7, 10, 4, 6, 5, 0, 16, 9, 12, 8, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[7], q[2];
cx q[8], q[7];
cx q[10], q[9];
cx q[14], q[13];
cx q[16], q[15];
cx q[17], q[16];
cx q[3], q[6];
