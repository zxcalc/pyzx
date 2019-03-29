// Initial wiring: [4, 18, 2, 13, 0, 10, 16, 5, 8, 11, 12, 15, 1, 7, 19, 17, 3, 9, 6, 14]
// Resulting wiring: [4, 18, 2, 13, 0, 10, 16, 5, 8, 11, 12, 15, 1, 7, 19, 17, 3, 9, 6, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[6], q[4];
cx q[7], q[2];
cx q[11], q[12];
