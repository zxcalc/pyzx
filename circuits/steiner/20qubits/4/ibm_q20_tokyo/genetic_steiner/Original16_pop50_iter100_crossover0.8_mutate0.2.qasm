// Initial wiring: [18, 0, 10, 16, 15, 14, 13, 2, 3, 19, 4, 1, 8, 11, 6, 9, 17, 12, 7, 5]
// Resulting wiring: [18, 0, 10, 16, 15, 14, 13, 2, 3, 19, 4, 1, 8, 11, 6, 9, 17, 12, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[15], q[16];
cx q[11], q[17];
cx q[4], q[6];
