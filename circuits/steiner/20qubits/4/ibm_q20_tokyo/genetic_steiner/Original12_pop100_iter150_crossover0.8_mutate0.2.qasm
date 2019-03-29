// Initial wiring: [4, 13, 2, 18, 3, 9, 11, 12, 6, 7, 19, 5, 1, 8, 17, 16, 15, 10, 0, 14]
// Resulting wiring: [4, 13, 2, 18, 3, 9, 11, 12, 6, 7, 19, 5, 1, 8, 17, 16, 15, 10, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[9], q[8];
cx q[12], q[11];
cx q[3], q[5];
