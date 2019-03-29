// Initial wiring: [14, 0, 11, 8, 7, 1, 12, 3, 19, 18, 2, 4, 9, 6, 10, 16, 13, 15, 17, 5]
// Resulting wiring: [14, 0, 11, 8, 7, 1, 12, 3, 19, 18, 2, 4, 9, 6, 10, 16, 13, 15, 17, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[17], q[16];
cx q[12], q[18];
cx q[5], q[6];
