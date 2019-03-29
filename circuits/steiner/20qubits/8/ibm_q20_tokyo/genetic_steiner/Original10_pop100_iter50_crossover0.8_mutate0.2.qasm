// Initial wiring: [17, 4, 2, 9, 11, 0, 16, 12, 5, 19, 18, 7, 15, 3, 6, 8, 14, 13, 1, 10]
// Resulting wiring: [17, 4, 2, 9, 11, 0, 16, 12, 5, 19, 18, 7, 15, 3, 6, 8, 14, 13, 1, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[17], q[16];
cx q[17], q[12];
cx q[4], q[6];
cx q[2], q[3];
cx q[3], q[5];
cx q[1], q[8];
cx q[1], q[2];
