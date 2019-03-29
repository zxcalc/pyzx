// Initial wiring: [18, 14, 13, 1, 7, 12, 10, 4, 5, 17, 2, 16, 6, 19, 11, 0, 3, 8, 9, 15]
// Resulting wiring: [18, 14, 13, 1, 7, 12, 10, 4, 5, 17, 2, 16, 6, 19, 11, 0, 3, 8, 9, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[6], q[3];
cx q[8], q[11];
cx q[7], q[13];
