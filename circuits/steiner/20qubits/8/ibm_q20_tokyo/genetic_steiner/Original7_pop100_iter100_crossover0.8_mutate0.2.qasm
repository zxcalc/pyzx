// Initial wiring: [16, 19, 13, 11, 17, 14, 0, 6, 10, 12, 2, 4, 15, 9, 1, 8, 18, 5, 7, 3]
// Resulting wiring: [16, 19, 13, 11, 17, 14, 0, 6, 10, 12, 2, 4, 15, 9, 1, 8, 18, 5, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[8], q[2];
cx q[13], q[12];
cx q[16], q[15];
cx q[17], q[12];
cx q[2], q[7];
cx q[1], q[2];
