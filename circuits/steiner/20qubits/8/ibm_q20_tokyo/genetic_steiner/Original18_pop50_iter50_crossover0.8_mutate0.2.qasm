// Initial wiring: [7, 0, 4, 18, 8, 3, 12, 19, 17, 16, 13, 14, 15, 9, 11, 10, 6, 2, 1, 5]
// Resulting wiring: [7, 0, 4, 18, 8, 3, 12, 19, 17, 16, 13, 14, 15, 9, 11, 10, 6, 2, 1, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[16];
cx q[8], q[11];
cx q[8], q[10];
cx q[3], q[6];
cx q[3], q[4];
cx q[0], q[1];
