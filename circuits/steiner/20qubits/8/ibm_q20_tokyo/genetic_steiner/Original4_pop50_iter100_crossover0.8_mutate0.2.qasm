// Initial wiring: [10, 12, 18, 5, 6, 9, 8, 0, 13, 16, 3, 19, 11, 2, 4, 14, 15, 17, 7, 1]
// Resulting wiring: [10, 12, 18, 5, 6, 9, 8, 0, 13, 16, 3, 19, 11, 2, 4, 14, 15, 17, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[11], q[10];
cx q[13], q[6];
cx q[19], q[10];
cx q[13], q[16];
cx q[12], q[18];
cx q[12], q[17];
cx q[7], q[8];
