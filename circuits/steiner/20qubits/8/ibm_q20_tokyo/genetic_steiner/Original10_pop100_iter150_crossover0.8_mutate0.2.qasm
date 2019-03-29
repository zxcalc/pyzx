// Initial wiring: [10, 11, 7, 13, 8, 15, 14, 16, 5, 19, 3, 4, 17, 12, 1, 0, 9, 2, 6, 18]
// Resulting wiring: [10, 11, 7, 13, 8, 15, 14, 16, 5, 19, 3, 4, 17, 12, 1, 0, 9, 2, 6, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[13], q[7];
cx q[17], q[16];
cx q[16], q[15];
cx q[11], q[17];
cx q[3], q[6];
cx q[3], q[5];
cx q[1], q[7];
