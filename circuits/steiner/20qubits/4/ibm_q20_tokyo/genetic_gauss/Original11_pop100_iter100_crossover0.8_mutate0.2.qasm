// Initial wiring: [6, 4, 5, 14, 12, 19, 11, 8, 3, 7, 9, 16, 13, 0, 18, 2, 17, 10, 1, 15]
// Resulting wiring: [6, 4, 5, 14, 12, 19, 11, 8, 3, 7, 9, 16, 13, 0, 18, 2, 17, 10, 1, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[2];
cx q[13], q[8];
cx q[12], q[15];
cx q[6], q[16];
