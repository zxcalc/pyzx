// Initial wiring: [6, 9, 4, 12, 16, 15, 18, 3, 1, 10, 0, 14, 17, 2, 7, 19, 11, 8, 5, 13]
// Resulting wiring: [6, 9, 4, 12, 16, 15, 18, 3, 1, 10, 0, 14, 17, 2, 7, 19, 11, 8, 5, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[14], q[13];
cx q[17], q[16];
cx q[5], q[6];
