// Initial wiring: [8, 17, 4, 16, 14, 3, 10, 12, 5, 18, 19, 0, 11, 15, 7, 1, 9, 2, 13, 6]
// Resulting wiring: [8, 17, 4, 16, 14, 3, 10, 12, 5, 18, 19, 0, 11, 15, 7, 1, 9, 2, 13, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[6], q[4];
cx q[8], q[2];
cx q[9], q[0];
cx q[11], q[10];
cx q[12], q[7];
cx q[13], q[16];
cx q[8], q[9];
