// Initial wiring: [14, 5, 16, 12, 7, 2, 15, 18, 17, 11, 3, 8, 4, 0, 10, 13, 1, 9, 19, 6]
// Resulting wiring: [14, 5, 16, 12, 7, 2, 15, 18, 17, 11, 3, 8, 4, 0, 10, 13, 1, 9, 19, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[16];
cx q[12], q[18];
cx q[3], q[4];
cx q[1], q[2];
