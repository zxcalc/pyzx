// Initial wiring: [8, 17, 12, 19, 10, 13, 1, 2, 14, 9, 11, 5, 0, 6, 3, 16, 7, 4, 18, 15]
// Resulting wiring: [8, 17, 12, 19, 10, 13, 1, 2, 14, 9, 11, 5, 0, 6, 3, 16, 7, 4, 18, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[12], q[6];
cx q[17], q[16];
cx q[16], q[15];
cx q[18], q[17];
cx q[18], q[12];
cx q[7], q[12];
cx q[4], q[5];
