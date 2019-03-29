// Initial wiring: [18, 8, 10, 1, 12, 19, 4, 6, 0, 13, 15, 3, 7, 14, 9, 16, 17, 11, 5, 2]
// Resulting wiring: [18, 8, 10, 1, 12, 19, 4, 6, 0, 13, 15, 3, 7, 14, 9, 16, 17, 11, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[10], q[9];
cx q[14], q[16];
cx q[3], q[4];
